<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            %{--<a class="brand" href="http://www.runningforbrews.com">RFB Pub Golf</a>--}%
            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li class="active"><a href="${g.createLink (uri: '/')}">Home</a></li>
                    <li><a href=<g:createLink mapping="rules"/>>Pub Golf Rules</a></li>
                    <li><a href=<g:createLink mapping="scoring"/>>Scoring</a></li>
                    <li><a href=<g:createLink uri="/about"/>>About</a></li>
                    <li><a href="http://www.runningforbrews.com">Running for Brews</a></li>

                </ul>

            </div><!--/.nav-collapse -->
        </div>
    </div>
</div>