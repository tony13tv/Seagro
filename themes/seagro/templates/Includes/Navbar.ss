<div class="logos">
    <div class="box_logos">
        <a href="$Page('home').Link"><img data-ix="new-interaction-2" src="$ThemeDir/images/logo.png" width="269">
        </a>
        <div class="box-menu">
            <ul class="nav navbar-nav navbar-right bpx-menu">
                <li id="fat-menu" class="dropdown">
                    <a href="#" class="dropdown-toggle" id="drop3" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        <img src="$ThemeDir/images/menu.png">
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="drop3">
                        <% loop $Menu(1) %>
                            <li><a href="$Link">$Title</a></li>
                        <% end_loop %>
                    </ul>
                </li>
            </ul>
            <div class="box-search w-hidden-small w-hidden-tiny"><img src="$ThemeDir/images/search.png">
            </div>
        </div>
    </div>
</div>
