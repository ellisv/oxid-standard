[{if $oView->isLanguageLoaded()}]
    <li class="dropdown">
        [{capture name="languageList"}]
            [{foreach from=$oxcmp_lang item=lang}]
                [{if $lang->selected}]
                    [{capture name="languageSelected"}]
                        <a href="[{$lang->link|oxaddparams:$oView->getDynUrlParams()}]" hreflang="[{$lang->abbr}]" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">[{$lang->name}] <i class="caret"></i></a>
                    [{/capture}]
                [{/if}]
                <li[{if $lang->selected}] class="active"[{/if}]><a href="[{$lang->link|oxaddparams:$oView->getDynUrlParams()}]" hreflang="[{$lang->abbr}]"><i class="flag flag-[{$lang->abbr}]"></i> [{$lang->name}][{if $lang->selected}] <span class="sr-only">([{oxmultilang ident="CURRENT"}])</span>[{/if}]</a></li>
            [{/foreach}]
        [{/capture}]
        [{$smarty.capture.languageSelected}]
        <ul class="dropdown-menu navmenu-nav" role="menu">
            [{$smarty.capture.languageList}]
        </ul>
    </li>
[{/if}]
