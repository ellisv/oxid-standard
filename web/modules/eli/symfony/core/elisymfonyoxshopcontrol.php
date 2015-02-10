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
use Symfony\Component\Debug;

/**
 * Extension of oxShopControl OXID core class
 *
 * @see oxShopControl
 */
class eliSymfonyOxShopControl extends eliSymfonyOxShopControl_parent implements ContainerAwareInterface
{
    /**
     * @var ContainerInterface
     */
    protected $_oContainer;

    /**
     * Set default exception handler
     *
     * If Kernel is in debug mode than we register
     * Symfony Debug component's Exception and Error handlers
     * and do not call parent method
     *
     * Otherwise we stick to default OXID exception handler
     */
    protected function _setDefaultExceptionHandler()
    {
        if (!$this->_isKernelInDebug()) {
            parent::_setDefaultExceptionHandler();
            return;
        }

        // It would be cool to only use Debug::enable() in here
        // but it also registers a DebugClassLoader which will
        // always throw an error because OXID does not care about
        // case when refering to objects

        ini_set('display_errors', 0);
        Debug\ExceptionHandler::register();
        $handler = Debug\ErrorHandler::register();
        $handler->throwAt(0, true);
    }

    /**
     * Handle system exception.
     *
     * If kernel is in debug mode then we rethrow the exception.
     * Otherwise we call default OXID behavior
     *
     * @param oxException $oEx
     *
     * @throws oxException
     */
    protected function _handleSystemException($oEx)
    {
        if (!$this->_isKernelInDebug()) {
            parent::_handleSystemException($oEx);
            return;
        }

        throw $oEx;
    }

    /**
     * Handle cookie exception.
     *
     * If kernel is in debug mode then we rethrow the exception.
     * Otherwise we call default OXID behavior
     *
     * @param oxException $oEx
     *
     * @throws oxException
     */
    protected function _handleCookieException($oEx)
    {
        if (!$this->_isKernelInDebug()) {
            parent::_handleCookieException($oEx);
            return;
        }

        throw $oEx;
    }

    /**
     * Handle database connection exception.
     *
     * If kernel is in debug mode then we rethrow the exception.
     * Otherwise we call default OXID behavior
     *
     * @param oxException $oEx
     *
     * @throws oxException
     */
    protected function _handleDbConnectionException($oEx)
    {
        if (!$this->_isKernelInDebug()) {
            parent::_handleDbConnectionException($oEx);
            return;
        }

        throw $oEx;
    }

    /**
     * Handle base exception.
     *
     * If kernel is in debug mode then we rethrow the exception.
     * Otherwise we call default OXID behavior
     *
     * @param oxException $oEx
     *
     * @throws oxException
     */
    protected function _handleBaseException($oEx)
    {
        if (!$this->_isKernelInDebug()) {
            parent::_handleBaseException($oEx);
            return;
        }

        throw $oEx;
    }

    /**
     * Is kernel in debug mode?
     *
     * @return bool
     */
    protected function _isKernelInDebug()
    {
        return $this->_oContainer->get('kernel')->isDebug();
    }

    /**
     * {@inheritdoc}
     */
    public function setContainer(ContainerInterface $container = null)
    {
        $this->_oContainer = $container;
    }
}
