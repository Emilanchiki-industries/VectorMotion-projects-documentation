#!/usr/bin/env nu

while true {
    ls | where name != internals and type == dir | get name | each {|directory|
        let schema_name = $"($directory).json"
        let schema_copy = ("internals" | path join $schema_name)
        let gloabl_schema = "./Project description schema.json"
        cp --force $gloabl_schema $schema_copy

        try {
            let content = (open $"($directory)/Description.yaml" | transpose)
            let length = ($content | length) - 1
            mut items = []
            for i in 0..$length {
                $items = ($items | append ($content | get ([$i column1 scenes] | into cell-path) | transpose | get column0))
            }

            print "Processed" $schema_copy
            print ($items | uniq)

            open $schema_copy | update "$defs"."layers"."patternProperties"."^\\S+.*\\S$"."properties"."dependencies"."items"."oneOf".0."examples" $items | to json | save --force $schema_copy

            let settings = ".vscode/settings.json"
            open $settings | update "yaml.schemas" { insert $schema_copy $"($directory)/Description.yaml" } | to json | save --force $settings
        }

        sleep 2sec
    }
}
