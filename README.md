A simple shell script to move a repository within another one while keeping all its history of commits.
Based on the post by [Benjamin Peirce](http://bpeirce.me/moving-one-git-repository-into-another.html).

Usage:
`./script.sh subprojectName mainRepo subprojectRepo`


Example:
`./script.sh mapNorway https://github.com/mapWorld https://github.com/mapNorge`

Originally with file structures like these:
```
mapWorld/
├── mapChina/
│   ├── ...
│   └── ...
├── mapFrance/
│   ├── ...
│   ├── ...
│   ├── ...
│   └── ...
└── mapUSA/
    ├── ...
    ├── ...
    ├── ...
    └── ...
```
and
```
mapNorge/
├── img/
│   ├── ...
│   ├── ...
│   ├── ...
│   └── bootstrap-theme.min.css
├── ...
└── contextInfo/
    ├── ...
    ├── ...
    ├── ...
    └── ...
```

This is what you want to achieve:
```
mapWorld/
├── mapChina/
│   ├── ...
│   └── ...
├── mapFrance/
│   ├── ...
│   ├── ...
│   ├── ...
│   └── ...
├── mapNorway/
│   ├── img/
│   │   ├── ...
│   │   ├── ...
│   │   ├── ...
│   │   └── bootstrap-theme.min.css
│   ├── ...
│   └── contextInfo/
│       ├── ...
│       ├── ...
│       ├── ...
│       └── ...
└── mapUSA/
    ├── ...
    ├── ...
    ├── ...
    └── ...
```

