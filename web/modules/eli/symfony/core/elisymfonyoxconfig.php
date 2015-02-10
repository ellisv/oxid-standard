<?php

/*
 * This file is part of the Symfony Bridge module for OXID.
 *
 * (c) Eligijus Vitkauskas <eligijusvitkauskas@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

use Symfony\Component\DependencyInjection\ContainerAwareInterface;
use Symfony\Component\DependencyInjection\ContainerInterface;

/**
 * Extension of core oxConfig class
 *
 * @see oxConfig
 */
class eliSymfonyOxConfig extends eliSymfonyOxConfig_parent implements ContainerAwareInterface
{
    /**
     * @var ContainerInterface
     */
    protected $_oContainer;

    /**
     * Returns log files storage path
     *
     * If container has a kernel.logs_dir parameter this one is returned
     * otherwise we fall back do default OXID value
     *
     * @return string
     */
    public function getLogsDir()
    {
        if (!$this->_oContainer->hasParameter('kernel.logs_dir')) {
            return parent::getLogsDir();
        }

        return $this->_oContainer->getParameter('kernel.logs_dir');
    }

    /**
     * {@inheritdoc}
     */
    public function setContainer(ContainerInterface $container = null)
    {
        $this->_oContainer = $container;
    }
}
