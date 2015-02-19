Symfony Bridge module for OXID
==============================

Provides integration for OXID with various Symfony components.

## Requirements

* OXID eShop 5.2.x/4.9.x
* Composer autoloader
* Globally accessable `$kernel` variable which stores an object which is an instance of `Symfony\Component\HttpKernel\KernelInterface`
* `symfony/dependency-injection` component
* `symfony/debug` component

## Features

* Provides integration with Symfony/Debug component if kernel is in debug mode
* Automatically injects Container to objects which were created with `oxNew()` (`oxRegistry::get()` also, because it uses `oxNew()` internally) and implements ContainerAwareInterface
* Integration for PSR-3 logging if logger service is available

## Installation

Activate the module in administration area.

## Uninstall

Disable the module in administration area and delete module folder.

## Credits

* Author: Eligijus Vitkauskas
* URL: https://github.com/EllisV
* Mail: eligijusvitkauskas@gmail.com
