<?php

use Symfony\Component\DependencyInjection\ContainerAwareInterface;

/**
 * Extension of oxUtilsObject OXID core class
 *
 * @see oxUtilsObject
 */
class eliSymfonyOxUtilsObject extends eliSymfonyOxUtilsObject_parent
{
    /**
     * {@inheritdoc}
     *
     * Injects DependencyInjection container on ContainerAwareInterface
     * instances.
     *
     * oxNew() uses this method to build objects, so we are basically
     * providing a way of having a container on all OXID objects
     * which are ContainerAwareInterface instances.
     */
    protected function _getObject($sClassName, $iArgCnt, $aParams)
    {
        $oObject = parent::_getObject($sClassName, $iArgCnt, $aParams);

        if ($oObject instanceof ContainerAwareInterface) {
            global $kernel;
            $oObject->setContainer($kernel->getContainer());
        }

        return $oObject;
    }
}
