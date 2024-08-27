#!/usr/local/bin/r3
Rebol [
]
;--Oldes's code
fourcc: func[
    "Converts fourcc codec integer to string and back"
    codec [any-string! binary! number!]][
    either number? codec [
        to string! reverse trim to binary! to integer! codec
    ][
        to integer! reverse to binary! codec
    ]
]
fourcc "avc1"    ;== 828601953
fourcc 828601953 ;== "avc1"

print fourcc 844715353