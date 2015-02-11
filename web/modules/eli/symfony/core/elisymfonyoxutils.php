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
 * An extension of core oxUtils class to overwritte default logging methods
 *
 * @see oxUtils
 */
class eliSymfonyOxUtils extends eliSymfonyOxUtils_parent implements ContainerAwareInterface
{
    /**
     * @var ContainerInterface
     */
    protected $_oContainer;

    /**
     * Processes debug logging.
     *
     * If logger service is available then we process it as debug output.
     * Otherwise we call default OXID behavior.
     *
     * @param string $sText
     * @param bool   $blNewline
     */
    public function logger($sText, $blNewline = false)
    {
        $oContainer = $this->_oContainer;
        if (!$oContainer->has('logger')) {
            parent::logger($sText, $blNewline);
            return;
        }

        if (gettype($sText) != 'string') {
            $sText = var_export($sText, true);
        }

        $this->_oContainer->get('logger')->debug($sText);
    }

    /**
     * Writes given log message.
     *
     * If logger service is available then we perform a check on a filename to
     * determine what kind of output it should be on a logger service and if
     * filename happens to be an exception log file name than we also parse
     * this log message because we are unable to overwritte
     * oxException::debugOut().
     *
     * If logger service is unavailable then we call default OXID behavior.
     *
     * @param string $sLogMessage  log message
     * @param string $sLogFileName log file name
     *
     * @return bool
     */
    public function writeToLog($sLogMessage, $sLogFileName)
    {
        $oContainer = $this->_oContainer;
        if (!$oContainer->has('logger')) {
            return parent::writeToLog($sLogMessage, $sLogFileName);
        }

        $oLogger = $oContainer->get('logger');
        $sExceptionFileName = oxRegistry::get('oxExceptionHandler')->getLogFileName();

        switch ($sLogFileName) {
            case $sExceptionFileName:
                $aInfo = $this->_parseExceptionMessage($sLogMessage);
                $sMessage = $aInfo['message'];
                unset($aInfo['message']);
                $oLogger->critical($sMessage, $aInfo);
                break;
            case 'oxdebugdb.txt':
                $oLogger->debug($sLogMessage);
                break;
            default:
                $oLogger->error($sLogMessage);
        }

        return true;
    }

    /**
     * Performs a parsing on an exception log message.
     *
     * This is only applicable for oxException generated log messages.
     *
     * NOTE: We are unable to overwrite oxException class and
     * oxException::debugOut() is responsible for logging exceptions. To still
     * have a nice output at our logs we parse those exceptions messages.
     *
     * @param string $sMessage
     *
     * @return array with class, message and stack_trace keys
     */
    protected function _parseExceptionMessage($sMessage)
    {
        $aMatches = array();
        preg_match('/(\S*) \(time: .+\): \[.*\]: (.*) \n Stack Trace: (.*)\n?#\d+ {main}/s', $sMessage, $aMatches);

        return array(
            'class'       => $aMatches[1],
            'message'     => $aMatches[2],
            'stack_trace' => $this->_parseStackTrace($aMatches[3])
        );
    }

    /**
     * Parse stack trace string to the associative array
     *
     * @param string $sStackTrace
     *
     * @return array
     */
    protected function _parseStackTrace($sStackTrace)
    {
        $aStack = explode("\n", $sStackTrace);

        return array_map(function ($sLine) {
            return preg_replace('/^#\d+ /', '', $sLine);
        }, $aStack);
    }

    /**
     * {@inheritdoc}
     */
    public function setContainer(ContainerInterface $container = null)
    {
        $this->_oContainer = $container;
    }
}
