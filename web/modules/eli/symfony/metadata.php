<?php

/**
 * Metadata version
 */
$sMetadataVersion = '1.2';

/**
 * Module information
 */
$aModule = array(
    'id'          => 'elisymfony',
    'title'       => 'Symfony Bridge module',
    'description' => 'Adapts Symfony components into the shop',
    'thumbnail'   => '',
    'version'     => '0.0.1-DEV',
    'author'      => 'Eligijus Vitkauskas',
    'url'         => 'https://github.com/EllisV',
    'email'       => 'eligijusvitkauskas@gmail.com',
    'extend'      => array(
        'oxshopcontrol' => 'eli/symfony/core/elisymfonyoxshopcontrol',
        'oxutilsobject' => 'eli/symfony/core/elisymfonyoxutilsobject',
    ),
    'files'       => array(),
    'templates'   => array(),
    'blocks'      => array(),
    'settings'    => array(),
    'events'      => array(),
);
