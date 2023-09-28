# gha-php-static-checks

## Description
Run PHP static checks, annotate build and artifact results.
ℹ The PHP image used can be passed through `php-image` input or through `PROJECT_IMAGE` env variable.  
**NOTE:** If you use [gha-image-setup](https://github.com/adore-me/gha-image-setup) in a previous step you don't need to worry about it, as it already sets the `PROJECT_IMAGE` 👌  
**Input** takes precedence!

## Inputs
| Key                   | Required  | Default         | Description                                                                                            |
|-----------------------|-----------|-----------------|--------------------------------------------------------------------------------------------------------|
| **php-image**         | **false** | `N/A`           | PHP image to use (fully qualified image address).<br/>**Ex**: quay.io/adoreme/nginx-fpm-alpine:v0.0.1) |
| **run-phpcs**         | **true**  | `true`          | Enable/disable PHP Checkstyle.                                                                         |
| **phpcs-standard**    | **false** | `PSR2`          | Defines which standard will be used by PHP Checkstyle. Omit it, to use default standard (PSR2).        |
| **run-phpmd**         | **true**  | `true`          | Enable/disable PHP Mess Detector.                                                                      |
| **run-phpcpd**        | **true**  | `true`          | Enable/disable PHP Copy/Paste Detector.                                                                |
| **run-phpstan**       | **true**  | `true`          | Enable/disable PHP STAN.                                                                               |
| **run-rector**        | **false** | `false`         | Enable/disable Rector checks.                                                                          |
| **run-laravel-pint**  | **false** | `false`         | Enable/disable Laravel Pint checks.                                                                    |
| **github-token**      | **false** | ``              | Required by rector/laravel pint to run report validation .                                             |
| **reports-dir**       | **true**  | `build/reports` | Path to reports directory (no trailing `/`).                                                           |
| **app-dir**           | **false** | ``              | Source directory (no trailing `/`). When empty will try to guess if is `src` or `app`.                 |

## Outputs
**N/A**

## This action depends on:
- [adore-me/gha-php-checkstyle](https://github.com/adore-me/gha-php-checkstyle) ⭐
- [adore-me/gha-php-md](https://github.com/adore-me/gha-php-md) 🤯
- [adore-me/gha-php-cpd](https://github.com/adore-me/gha-php-cpd) 📋
- [adore-me/gha-php-stan](https://github.com/adore-me/gha-php-stan) 🤷‍♂️

Please read the **README.md** of each action for more details and keep an eye out for new versions 🚀

### Example of step configuration and usage:
```yaml
steps:
  - name: 'Run Static Checks'
    uses: adore-me/gha-php-static-checks@master
    with:
      github-token: ${{ secrets.GITHUB_TOKEN }}
      php-image: SOME_IMAGE # or `PROJECT_IMAGE` env var set
      run-phpcs: 'true'
      phpcs-standard: 'PSR12'
      run-phpmd: 'true'
      run-phpcpd: 'false'
      run-phpstan: 'true'
      run-rector: 'true'
      run-laravel-pint: 'true'
      reports-dir: 'build/reports'
      app-dir: ''
```

You can skip the `with` section if you are ok with the default values.
```yaml
steps:
  - name: 'Run Static Checks'
    uses: adore-me/gha-php-static-checks@master
```
