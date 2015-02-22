[{block name="footer_services"}]
    <ul class="list-inline">
        [{block name="footer_services_items"}]
            <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=contact"}]">[{oxmultilang ident="CONTACT"}]</a></li>
            <li><a href="[{$oViewConf->getHelpPageLink()}]">[{oxmultilang ident="HELP"}]</a></li>
            <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=links"}]">[{oxmultilang ident="LINKS"}]</a></li>
            <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=guestbook"}]">[{oxmultilang ident="GUESTBOOK"}]</a></li>
            [{if $oView->isActive('Invitations')}]
                <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=invite"}]" rel="nofollow">[{oxmultilang ident="INVITE_YOUR_FRIENDS"}]</a></li>
            [{/if}]
        [{/block}]
    </ul>
[{/block}]
