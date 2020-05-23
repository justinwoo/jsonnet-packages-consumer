# jsonnet packages consumer

if you don't know what this is, you don't need to know

## build

```nix
src = pkgs.fetchFromGitHub {
  owner = "justinwoo";
  repo = "package-sets";
  rev = "d210782ca373f5ee065cd2249cd9e98aeb1be64c";
  sha256 = "1lw3sck6s3sr8v7sbqn3nd3pi8jwzfr12pawi59gpmhq4l0ays73";
};

''
  jsonnet -J $src/src ${./overrides.jsonnet} -o $out/packages.json
''
```

`-J`: add path to jsonnet library search path

## jsonnet

```jsonnet
local upstream = import 'packages.jsonnet';
```

`packages.jsonnet` is matched from `$src/src` above and retrieved.

## result

```
$ ls result
packages.json

$ jq 'length' result/packages.json
369

$ jq '."simple-json"' result/packages.json
{
  "dependencies": [
    "arrays",
    "exceptions",
    "foreign",
    "foreign-object",
    "globals",
    "nullable",
    "prelude",
    "record",
    "typelevel-prelude",
    "variant"
  ],
  "repo": "https://github.com/justinwoo/purescript-simple-json.git",
  "version": "override"
}
```
