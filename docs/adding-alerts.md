## Adding Alerts

1. [Who to contact](#who-to-contact)
2. [Basic alert](#basic-alert) (emergency fast instructions)
3. [Detailed alert](#detailed-alert)
4. [Clearing an alert](#clearing-an-alert)

#### Who to Contact

The following people can publish alerts on this site.  Their email
addresses are on the linked GitHub profiles.

- Andrew Chow, [@achow101](https://github.com/achow101), achow101 on Freenode
- David Harding, [@harding](https://github.com/harding), harding on Freenode

#### Basic Alert

1. Open your editor on a file named `_alerts/YYYY-MM-DD-short-title.md`
   (the alert will appear as
<https://btcinformation.org/en/alert/YYYY-MM-DD-short-title>).

2. Paste the following text into the top of the file:
```
---
## Title displayed on alert page
title: "11/12 March 2017 Chain Fork"
## Short URL: https://btcinformation.org/<shorturl>
shorturl: "chainfork"
## Active alerts will display the banner (below) on all btcinformation.org content pages
active: true
## Banner displayed if 'active: true'.  Can use HTML formatting banner: "<b>Chain fork</b> - Please stop mining on bitcoin version 0.14.1. Click here for more information."
## Date of the alert in YYYY-MM-DD format
date: 2017-03-11
---

{% comment %}
First paragraph should indicate whose bitcoins are safe, to avoid starting a panic.
{% endcomment %}

Your bitcoins are safe if you received them in transactions confirmed before 2015-07-06 00:00 UTC.

{% comment %}
Second paragraph should summarize the problem, and subsequent
text should indicate what people should do immediately.
Consider: users (by wallet type), merchants, and miners.
{% endcomment %}

However, there has been a problem with a planned upgrade. For
bitcoins received later than the time above, confirmation scores are
significantly less reliable then they usually are for users of
certain software:

- Lightweight (SPV) wallet users should wait an additional 30
  confirmations more than you would normally wait. Electrum users,
  please see this note.
```

- Edit the file.  It is written in [Markdown format](https://guides.github.com/features/mastering-markdown/).

- Commit it.

    - **Note:** the commit must be signed by one of the people in the
      [Who to Contact](#who-to-contact) section for site
      auto-building to work.

- Push the commit to the master branch. Rebuilding the site occurs
  automatically and takes 7 to 15 minutes.

    - **Note:** do not push additional commits until the alert is
      displayed on the live site.  The site build aborts and starts over
      when new commits are found.

- Proceed to the next section to improve the alert.

#### Detailed Alert

In addition to providing more information about how users should respond
to the situation, you can enhance the alert in several ways described
below.

The following fields may be defined in the the alert YAML header:

```yaml
---
## (Required; HTML text) Title displayed on alert page
title: "11/12 March 2017 Chain Fork"
## (Optional; display ASCII only) Short URL for use in P2P network alerts:
https://btcinformation.org/<shorturl>
shorturl: "chainfork"
## (Optional; default=false) Active alerts will display the banner (below) on
all btcinformation.org content pages
active: true
## (Optional; HTML text) Banner displayed if 'active: true'.  Can use HTML
formatting
banner: "<b>Chain fork</b> - Please stop mining on bitcoin version 0.14.1. Click
here for more information."
## (Optional; default=alert) CSS class to set banner color
##   alert = red  |  warning = orange  |  success = green  | info = blue
bannerclass: alert
---
```

The time of the last update should be placed on the page somewhere. UTC
should be used for all dates, and RFC 2822 format ( date -uR ) is
recommended for long dates. For example, place the date in the footer of
the document:

```html
<div style="text-align:right">
  <i>This notice last updated: Thu, 16 May 2017 01:37:00 UTC</i>
</div>
```

You may also want to create a page on the Wiki to allow anyone to
provide additional information.  If you do so, link to it from the
alert.

#### Clearing An Alert

To stop advertising an alert on every btcinformation.org page, change the YAML
header field `active` to *false*:

```yaml
## (Optional; default=false) Active alerts will display the banner (below) on
all btcinformation.org content pages
active: false
```

Alternatively, for a few days you can change the message and set the
CSS `bannerclass` to *success* to indicate the problem has been resolved.

```yaml
## (Optional; HTML text) Banner displayed if 'active: true'.  Can use HTML
formatting
banner: "<b>Chain fork</b> - situation resolved"
## (Optional; default=alert) CSS class to set banner color
##   alert = red  |  warning = orange  |  success = green  | info = blue
bannerclass: success
```

[markdown format]: https://help.github.com/articles/markdown-basics/
