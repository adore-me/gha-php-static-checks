# gha-php-static-checks

## Description
Run PHP static checks, annotate build and artifact results.

## Inputs
| Key             | Required | Default         | Description                                                                                            |
|-----------------|----------|-----------------|--------------------------------------------------------------------------------------------------------|
| **php-image**   | **true** | `N/A`           | PHP image to use (fully qualified image address).<br/>**Ex**: quay.io/adoreme/nginx-fpm-alpine:v0.0.1) |
| **run-phpcs**   | **true** | `true`          | Enable/disable PHP Checkstyle.                                                                         |
| **run-phpmd**   | **true** | `true`          | Enable/disable PHP Mess Detector.                                                                      |
| **run-phpcpd**  | **true** | `true`          | Enable/disable PHP Copy/Paste Detector.                                                                |
| **run-phpstan** | **true** | `true`          | Enable/disable PHP STAN.                                                                               |
| **reports-dir** | **true** | `build/reports` | Path to reports directory (no trailing `/`).                                                           |

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
      php-image: 'quay.io/adoreme/nginx-fpm-alpine:v0.0.1'
      run-phpcs: 'true'
      run-phpmd: 'true'
      run-phpcpd: 'false'
      run-phpstan: 'true'
      reports-dir: 'build/reports'
```

You can skip the `with` section if you are ok with the default values.
```yaml
steps:
  - name: 'Run Static Checks'
    uses: adore-me/gha-php-static-checks@master
```
