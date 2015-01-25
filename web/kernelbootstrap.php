<?php

if (!class_exists('\Composer\Autoload\ClassLoader')) {
    require_once __DIR__.'/../vendor/autoload.php';
}

global $kernel;

if ($kernel === null) {
    require_once __DIR__.'/../app/AppKernel.php';

    $env = getenv('SYMFONY_ENV') ?: 'prod';
    $debug = getenv('SYMFONY_DEBUG') !== '0' && $env !== 'prod';

    $kernel = new AppKernel($env, $debug);
    $kernel->boot();
}
