[{if $oView->loadCurrency()}]
    <li class="dropdown">
        [{capture name="currencyList"}]
            [{foreach from=$oxcmp_cur item=currency}]
                [{if $currency->selected}]
                    [{capture name="currencySelected"}]
                        <a href="[{$currency->link|oxaddparams:$oView->getDynUrlParams()}]" rel="nofollow" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">[{$currency->name}] <i class="caret"></i></a>
                    [{/capture}]
                [{/if}]
                <li[{if $currency->selected}] class="active"[{/if}]><a href="[{$currency->link|oxaddparams:$oView->getDynUrlParams()}]" rel="nofollow">[{$currency->name}][{if $currency->selected}] <span class="sr-only">([{oxmultilang ident="CURRENT"}])</span>[{/if}]</a>
            [{/foreach}]
        [{/capture}]
        [{$smarty.capture.currencySelected}]
        <ul class="dropdown-menu navmenu-nav" role="menu">
            [{$smarty.capture.currencyList}]
        </ul>
    </li>
[{/if}]
