{ pkgs, ... }:
{
  xdg.config.files = {
    "eilmeldung/config.toml".source = (pkgs.formats.toml { }).generate "config.toml" {
      article_scope = "all";
      keep_articles_days = 365;
      mouse_support = true;
      show_top_bar = false;
      sync_every_minutes = 60;

      feed_list = [
        "query: \"Unread\" unread"
        "query: \"Marked\" marked"
        "feeds"
        "* categories"
        "tags"
      ];

      feed_list_focused_width = "33%";
      article_list_focused_width = "85%";
      article_list_focused_height = "66%";
      article_content_focused_height = "80%";
    };
  };
}
