 /*
 * vscode-gulpfile.js
 *
 * Copyright (c) 2016, 2017 Jan T. Sott
 * Licensed under the MIT license.
 */

 // Dependencies
const gulp = require('gulp');
const debug = require('gulp-debug');
const file = require('gulp-file');
const jsonlint = require('gulp-jsonlint');
const rename = require('gulp-rename');
const xmlValid = require('gulp-xml-validator');
const ymlValid = require('gulp-yaml-validate');

// Supported files
const jsonFiles = [
    'Commands/*.sublime-build',
    'Commands/*.sublime-completions',
    'Preferences/*.sublime-settings',
    './package.json',
    './repository.json'
];

const xmlFiles = [
    'Preferences/*.tmPreferences',
    'Snippets/*.sublime-snippet',
];

const ymlFiles = [
    'Syntaxes/*.sublime-syntax',
    './.travis.yml'
];

// Deploy Build System
gulp.task('deploy:build:core:nsis', gulp.series( (done) => {
  const str = `{
  "cmd": ["makensis", "$file"],
  "working_dir": "\${project_path:\${folder}}",
  "file_regex": ".*rror in script:? \\\"(...*?)\\\" on line (\\\\d+)",
  "selector": "source.nsis",
  "windows": {
    "cmd": ["$packages\\\\NSIS IDE\\\\scripts\\\\nsis-build.cmd", "$file"]
  },
  "variants": [
    {
      "name": "strict",
      "cmd": ["makensis", "-WX", "$file"],
      "file_regex": ".*arning: .* \\\\((...*?):(\\\\d+)\\\\)",
      "windows": {
        "cmd": ["$packages\\\\NSIS IDE\\\\scripts\\\\nsis-build.cmd", "/WX", "$file"]
      }
    },
    {
      "name": "Wine",
      "cmd": ["sh", "$packages/NSIS IDE/scripts/build-wine.sh", "$file"],
      "file_regex": ".*rror in script:? \\\"(...*?)\\\" on line (\\\\d+)",
      "windows": {
        "cmd": ["echo", "This build system is not available on Windows"],
        "shell": true
      }
    },
    {
      "name": "Wine, strict",
      "cmd": ["sh", "$packages/NSIS IDE/scripts/build-wine.sh", "-WX", "$file"],
      "file_regex": ".*arning: .* \\\\((...*?):(\\\\d+)\\\\)",
      "windows": {
        "cmd": ["echo", "This build system is not available on Windows"],
        "shell": true
      }
    },
    {
      "name": "PowerShell",
      "cmd": ["bash", "-c", "echo This build system is only available on Windows"],
      "file_regex": ".*rror in script:? \\\"(...*?)\\\" on line (\\\\d+)",
      "windows": {
        "cmd": ["powershell", "-ExecutionPolicy", "Unrestricted", "-File", "$packages\\\\NSIS IDE\\\\scripts\\\\nsis-build.ps1", "\\\"$file\\\""]
      }
    },
    {
      "name": "PowerShell, strict",
      "cmd": ["bash", "-c", "echo This build system is only available on Windows"],
      "file_regex": ".*arning: .* \\\\((...*?):(\\\\d+)\\\\)",
      "windows": {
        "cmd": ["powershell", "-ExecutionPolicy", "Unrestricted", "-File", "$packages\\\\NSIS IDE\\\\scripts\\\\nsis-build.ps1", "/WX", "\\\"$file\\\""]
      }
    }
  ]
}
`;

  return file('NSIS.sublime-build', str, { src: true })
      .pipe(debug({title: 'deploy:build:core:nsis'}))
      .pipe(gulp.dest('Commands'));
  done();
}));

gulp.task('deploy:build:core:nsl-assembler', gulp.series( (done) => {
  const str = `{
  "cmd": ["makensis", "$file"],
  "working_dir": "\${project_path:\${folder}}",
  "file_regex": ".*rror in script:? \\\"(...*?)\\\" on line (\\\\d+)",
  "selector": "source.nsis",
  "windows": {
    "cmd": ["$packages\\\\NSIS IDE\\\\scripts\\\\nsis-build.cmd", "$file"]
  },
  "variants": [
    {
      "name": "strict",
      "cmd": ["makensis", "-WX", "$file"],
      "file_regex": ".*arning: .* \\\\((...*?):(\\\\d+)\\\\)",
      "windows": {
        "cmd": ["$packages\\\\NSIS IDE\\\\scripts\\\\nsis-build.cmd", "/WX", "$file"]
      }
    },
    {
      "name": "Wine",
      "cmd": ["sh", "$packages/NSIS IDE/scripts/build-wine.sh", "$file"],
      "file_regex": ".*rror in script:? \\\"(...*?)\\\" on line (\\\\d+)",
      "windows": {
        "cmd": ["echo", "This build system is not available on Windows"],
        "shell": true
      }
    },
    {
      "name": "Wine, strict",
      "cmd": ["sh", "$packages/NSIS IDE/scripts/build-wine.sh", "-WX", "$file"],
      "file_regex": ".*arning: .* \\\\((...*?):(\\\\d+)\\\\)",
      "windows": {
        "cmd": ["echo", "This build system is not available on Windows"],
        "shell": true
      }
    },
    {
      "name": "PowerShell",
      "cmd": ["bash", "-c", "echo This build system is only available on Windows"],
      "file_regex": ".*rror in script:? \\\"(...*?)\\\" on line (\\\\d+)",
      "windows": {
        "cmd": ["powershell", "-ExecutionPolicy", "Unrestricted", "-File", "$packages\\\\NSIS IDE\\\\scripts\\\\nsis-build.ps1", "\\\"$file\\\""]
      }
    },
    {
      "name": "PowerShell, strict",
      "cmd": ["bash", "-c", "echo This build system is only available on Windows"],
      "file_regex": ".*arning: .* \\\\((...*?):(\\\\d+)\\\\)",
      "windows": {
        "cmd": ["powershell", "-ExecutionPolicy", "Unrestricted", "-File", "$packages\\\\NSIS IDE\\\\scripts\\\\nsis-build.ps1", "/WX", "\\\"$file\\\""]
      }
    }
  ]
}
`;

  return file('NSIS.sublime-build', str, { src: true })
      .pipe(debug({title: 'deploy:build:core:nsl-assembler'}))
      .pipe(gulp.dest('Commands'));
  done();
}));

gulp.task('deploy:build:scripts:nsis', gulp.series( (done) => {
  gulp.src([
    './node_modules/sublime-makensis/scripts/build-wine.sh',
    './node_modules/sublime-makensis/scripts/build.cmd',
    './node_modules/sublime-makensis/scripts/build.ps1'
    ])
    .pipe(debug({title: 'deploy:build:scripts:nsis'}))
    .pipe(rename({prefix: 'nsis-'}))
    .pipe(gulp.dest('./Support'));
  done();
}));

gulp.task('deploy:build:scripts:nsl-assembler', gulp.series( (done) => {
  gulp.src([
    './node_modules/sublime-nsl-assembler/scripts/build-wine.sh',
    './node_modules/sublime-nsl-assembler/scripts/build.cmd',
    './node_modules/sublime-nsl-assembler/scripts/build.sh'
    ])
    .pipe(debug({title: 'deploy:build:scripts:nsl-assembler'}))
    .pipe(rename({prefix: 'nsl-assembler-'}))
    .pipe(gulp.dest('./Support'));
  done();
}));

gulp.task('deploy:completions', gulp.series( (done) => {
  gulp.src([
    './node_modules/sublime-drunken-nsis/DrunkenNSIS.sublime-completions',
    './node_modules/sublime-nsis-completions/InstallOptions.sublime-completions',
    './node_modules/sublime-nsis-completions/NSIS.sublime-completions',
    './node_modules/sublime-nsl-assembler/nsL Assembler.sublime-completions'
    ])
    .pipe(debug({title: 'deploy:completions'}))
    .pipe(gulp.dest('./Commands'));
  done();
}));

gulp.task('deploy:syntax', gulp.series( (done) => {
  gulp.src([
    './node_modules/sublime-nlf-syntax/NLF.sublime-syntax',
    './node_modules/sublime-nsis-syntax/NSIS.sublime-syntax',
    './node_modules/sublime-nsl-assembler/nsL Assembler.sublime-syntax'
    ])
    .pipe(debug({title: 'deploy:syntax'}))
    .pipe(gulp.dest('./Syntaxes'));
  done();
}));

gulp.task('deploy:linter', gulp.series( (done) => {
  gulp.src([
    './node_modules/sublime-linter-makensis/linter.py'
    ])
    .pipe(debug({title: 'deploy:linter'}))
    .pipe(gulp.dest('./'));
  done();
}));

gulp.task('deploy:settings', gulp.series( (done) => {
  gulp.src([
    './node_modules/sublime-nsis-completions/NSIS.sublime-settings',
    './node_modules/sublime-nsis-syntax/Miscellaneous.tmPreferences'
    ])
    .pipe(debug({title: 'deploy:settings'}))
    .pipe(gulp.dest('./Preferences'));
  done();
}));

gulp.task('deploy:snippets', gulp.series( (done) => {
  gulp.src([
    './node_modules/sublime-nlf-syntax/snippets/*.sublime-snippet',
    './node_modules/sublime-nsis-completions/snippets/*.sublime-snippet',
    './node_modules/sublime-nsis-plugins/snippets-dll/*.sublime-snippet',
    './node_modules/sublime-nsis-plugins/snippets-nsh/*.sublime-snippet',
    './node_modules/sublime-nsl-assembler/snippets/*.sublime-snippet'
    ])
    .pipe(debug({title: 'deploy:snippets'}))
    .pipe(gulp.dest('./Snippets'));
  done();
}));

gulp.task('deploy:includes', gulp.series( (done) => {
  gulp.src([
    './node_modules/sublime-nsis-plugins/Includes.sublime-completions'
    ])
    .pipe(debug({title: 'deploy:includes'}))
    .pipe(gulp.dest('./Commands'));
  done();
}));

// Lint JSON
gulp.task('lint:json', gulp.series( (done) => {
  gulp.src(jsonFiles)
    .pipe(debug({title: 'json-lint'}))
    .pipe(jsonlint())
    .pipe(jsonlint.failAfterError())
    .pipe(jsonlint.reporter());
  done();
}));

// Validate XML
gulp.task('lint:xml', gulp.series( (done) => {
  gulp.src(xmlFiles)
    .pipe(debug({title: 'xml-validator'}))
    .pipe(xmlValid());
  done();
}));

// Validate XML
gulp.task('lint:yml', gulp.series( (done) => {
  gulp.src(ymlFiles)
    .pipe(debug({title: 'yml-validate'}))
    .pipe(ymlValid({ safe: true }));
  done();
}));

// Private tasks
gulp.task('deploy:build:core',
  gulp.parallel(
      'deploy:build:core:nsis',
      'deploy:build:core:nsl-assembler',
      (done) => {
        done();
      }
  )
);

gulp.task('deploy:build:scripts',
  gulp.parallel(
      'deploy:build:scripts:nsis',
      'deploy:build:scripts:nsl-assembler',
      (done) => {
        done();
      }
  )
);

gulp.task('deploy:build',
  gulp.parallel(
      'deploy:build:core',
      'deploy:build:scripts',
      (done) => {
        done();
      }
  )
);

// Global tasks
gulp.task('lint',
  gulp.parallel(
    'lint:json',
    'lint:xml',
    (done) => {
      done();
    }
  )
);

gulp.task('deploy',
  gulp.parallel(
    'deploy:build',
    'deploy:completions',
    'deploy:includes',
    'deploy:linter',
    'deploy:settings',
    'deploy:snippets',
    'deploy:syntax',
    (done) => {
      done();
    }
  )
);

gulp.task('default',
  gulp.series(
    'deploy',
    'lint',
    (done) => {
      done();
    }
  )
);
