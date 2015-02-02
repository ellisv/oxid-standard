<?php

/*
 * This file is part of the Symfony Bridge module for OXID.
 *
 * (c) Eligijus Vitkauskas <eligijusvitkauskas@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

/**
 * Metadata version
 */
$sMetadataVersion = '1.2';

/**
 * Module information
 */
$aModule = array(
    'id'          => 'elisymfony',
    'title'       => 'Symfony Bridge',
    'description' => 'Provides integration for OXID with various Symfony components',
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
