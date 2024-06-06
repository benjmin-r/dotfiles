#!/bin/bash

# process some markdown file, so it's more like Logseq markdown
# Created with an LLM so the code could probably be better but I have no idea and don't care.

awk '
BEGIN {
    indent = 0
    dash = "- "
    line_count = 0
    first_paragraph = 0
    heading_encountered = 0
}
function get_indent(level) {
    result = ""
    for (i = 0; i < level; i++) {
        result = result "\t"
    }
    return result
}
{
    if (line_count < 5) {
        print $0
        line_count++
        next
    }
}
/^## / {
    indent = 1
    first_paragraph = 1
    heading_encountered = 1
    print get_indent(indent - 1) dash $0
    next
}
/^### / {
    indent = 2
    first_paragraph = 1
    heading_encountered = 1
    print get_indent(indent - 1) dash $0
    next
}
/^#### / {
    indent = 3
    first_paragraph = 1
    heading_encountered = 1
    print get_indent(indent - 1) dash $0
    next
}
/^#/ {
    indent = 0
    first_paragraph = 1
    heading_encountered = 1
    print dash $0
    next
}
{
    if (NF == 0) {
        print ""
    } else if (heading_encountered == 0) {
        printf("%s\n", $0)
    } else if (indent > 0) {
        if (first_paragraph) {
            printf("%s%s%s\n", get_indent(indent), dash, $0)
            first_paragraph = 0
        } else {
            printf("%s%s\n", get_indent(indent), $0)
        }
    } else {
        printf("%s%s\n", dash, $0)
    }
}
'

