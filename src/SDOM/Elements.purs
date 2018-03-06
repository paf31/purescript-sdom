module SDOM.Elements where

import SDOM
import Data.Either (Either)

a
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
a = element "a"

a_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
a_ = element_ "a"

abbr
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
abbr = element "abbr"

abbr_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
abbr_ = element_ "abbr"

acronym
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
acronym = element "acronym"

acronym_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
acronym_ = element_ "acronym"

address
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
address = element "address"

address_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
address_ = element_ "address"

applet
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
applet = element "applet"

applet_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
applet_ = element_ "applet"

area
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
area = element "area"

area_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
area_ = element_ "area"

article
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
article = element "article"

article_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
article_ = element_ "article"

aside
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
aside = element "aside"

aside_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
aside_ = element_ "aside"

audio
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
audio = element "audio"

audio_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
audio_ = element_ "audio"

b
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
b = element "b"

b_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
b_ = element_ "b"

base
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
base = element "base"

base_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
base_ = element_ "base"

basefont
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
basefont = element "basefont"

basefont_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
basefont_ = element_ "basefont"

bdi
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
bdi = element "bdi"

bdi_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
bdi_ = element_ "bdi"

bdo
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
bdo = element "bdo"

bdo_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
bdo_ = element_ "bdo"

big
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
big = element "big"

big_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
big_ = element_ "big"

blockquote
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
blockquote = element "blockquote"

blockquote_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
blockquote_ = element_ "blockquote"

body
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
body = element "body"

body_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
body_ = element_ "body"

br
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
br = element "br"

br_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
br_ = element_ "br"

button
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
button = element "button"

button_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
button_ = element_ "button"

canvas
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
canvas = element "canvas"

canvas_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
canvas_ = element_ "canvas"

caption
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
caption = element "caption"

caption_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
caption_ = element_ "caption"

center
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
center = element "center"

center_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
center_ = element_ "center"

cite
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
cite = element "cite"

cite_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
cite_ = element_ "cite"

code
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
code = element "code"

code_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
code_ = element_ "code"

col
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
col = element "col"

col_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
col_ = element_ "col"

colgroup
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
colgroup = element "colgroup"

colgroup_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
colgroup_ = element_ "colgroup"

datalist
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
datalist = element "datalist"

datalist_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
datalist_ = element_ "datalist"

dd
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
dd = element "dd"

dd_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
dd_ = element_ "dd"

del
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
del = element "del"

del_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
del_ = element_ "del"

details
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
details = element "details"

details_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
details_ = element_ "details"

dfn
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
dfn = element "dfn"

dfn_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
dfn_ = element_ "dfn"

dialog
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
dialog = element "dialog"

dialog_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
dialog_ = element_ "dialog"

dir
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
dir = element "dir"

dir_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
dir_ = element_ "dir"

div
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
div = element "div"

div_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
div_ = element_ "div"

dl
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
dl = element "dl"

dl_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
dl_ = element_ "dl"

dt
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
dt = element "dt"

dt_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
dt_ = element_ "dt"

em
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
em = element "em"

em_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
em_ = element_ "em"

embed
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
embed = element "embed"

embed_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
embed_ = element_ "embed"

fieldset
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
fieldset = element "fieldset"

fieldset_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
fieldset_ = element_ "fieldset"

figcaption
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
figcaption = element "figcaption"

figcaption_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
figcaption_ = element_ "figcaption"

figure
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
figure = element "figure"

figure_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
figure_ = element_ "figure"

font
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
font = element "font"

font_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
font_ = element_ "font"

footer
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
footer = element "footer"

footer_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
footer_ = element_ "footer"

form
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
form = element "form"

form_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
form_ = element_ "form"

frame
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
frame = element "frame"

frame_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
frame_ = element_ "frame"

frameset
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
frameset = element "frameset"

frameset_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
frameset_ = element_ "frameset"

h1
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
h1 = element "h1"

h1_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
h1_ = element_ "h1"

head
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
head = element "head"

head_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
head_ = element_ "head"

header
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
header = element "header"

header_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
header_ = element_ "header"

hr
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
hr = element "hr"

hr_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
hr_ = element_ "hr"

html
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
html = element "html"

html_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
html_ = element_ "htmch"

i
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
i = element "i"

i_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
i_ = element_ "i"

iframe
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
iframe = element "iframe"

iframe_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
iframe_ = element_ "iframe"

img
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
img = element "img"

img_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
img_ = element_ "img"

input
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
input = element "input"

input_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
input_ = element_ "input"

ins
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
ins = element "ins"

ins_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
ins_ = element_ "ins"

kbd
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
kbd = element "kbd"

kbd_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
kbd_ = element_ "kbd"

label
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
label = element "label"

label_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
label_ = element_ "label"

legend
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
legend = element "legend"

legend_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
legend_ = element_ "legend"

li
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
li = element "li"

li_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
li_ = element_ "li"

link
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
link = element "link"

link_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
link_ = element_ "link"

main
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
main = element "main"

main_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
main_ = element_ "main"

map
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
map = element "map"

map_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
map_ = element_ "map"

mark
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
mark = element "mark"

mark_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
mark_ = element_ "mark"

menu
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
menu = element "menu"

menu_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
menu_ = element_ "menu"

menuitem
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
menuitem = element "menuitem"

menuitem_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
menuitem_ = element_ "menuitem"

meta
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
meta = element "meta"

meta_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
meta_ = element_ "meta"

meter
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
meter = element "meter"

meter_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
meter_ = element_ "meter"

nav
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
nav = element "nav"

nav_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
nav_ = element_ "nav"

noframes
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
noframes = element "noframes"

noframes_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
noframes_ = element_ "noframes"

noscript
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
noscript = element "noscript"

noscript_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
noscript_ = element_ "noscript"

object
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
object = element "object"

object_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
object_ = element_ "object"

ol
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
ol = element "ol"

ol_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
ol_ = element_ "ol"

optgroup
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
optgroup = element "optgroup"

optgroup_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
optgroup_ = element_ "optgroup"

option
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
option = element "option"

option_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
option_ = element_ "option"

output
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
output = element "output"

output_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
output_ = element_ "outpuch"

p
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
p = element "p"

p_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
p_ = element_ "p"

param
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
param = element "param"

param_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
param_ = element_ "param"

picture
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
picture = element "picture"

picture_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
picture_ = element_ "picture"

pre
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
pre = element "pre"

pre_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
pre_ = element_ "pre"

progress
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
progress = element "progress"

progress_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
progress_ = element_ "progresch"

q
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
q = element "q"

q_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
q_ = element_ "q"

rp
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
rp = element "rp"

rp_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
rp_ = element_ "rp"

rt
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
rt = element "rt"

rt_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
rt_ = element_ "rt"

ruby
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
ruby = element "ruby"

ruby_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
ruby_ = element_ "rubch"

s
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
s = element "s"

s_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
s_ = element_ "s"

samp
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
samp = element "samp"

samp_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
samp_ = element_ "samp"

script
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
script = element "script"

script_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
script_ = element_ "script"

section
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
section = element "section"

section_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
section_ = element_ "section"

select
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
select = element "select"

select_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
select_ = element_ "select"

small
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
small = element "small"

small_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
small_ = element_ "small"

source
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
source = element "source"

source_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
source_ = element_ "source"

span
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
span = element "span"

span_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
span_ = element_ "span"

strike
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
strike = element "strike"

strike_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
strike_ = element_ "strike"

strong
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
strong = element "strong"

strong_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
strong_ = element_ "strong"

style
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
style = element "style"

style_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
style_ = element_ "style"

sub
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
sub = element "sub"

sub_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
sub_ = element_ "sub"

summary
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
summary = element "summary"

summary_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
summary_ = element_ "summary"

sup
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
sup = element "sup"

sup_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
sup_ = element_ "sup"

table
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
table = element "table"

table_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
table_ = element_ "table"

tbody
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
tbody = element "tbody"

tbody_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
tbody_ = element_ "tbody"

td
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
td = element "td"

td_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
td_ = element_ "td"

template
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
template = element "template"

template_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
template_ = element_ "template"

textarea
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
textarea = element "textarea"

textarea_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
textarea_ = element_ "textarea"

tfoot
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
tfoot = element "tfoot"

tfoot_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
tfoot_ = element_ "tfoot"

th
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
th = element "th"

th_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
th_ = element_ "th"

thead
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
thead = element "thead"

thead_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
thead_ = element_ "thead"

time
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
time = element "time"

time_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
time_ = element_ "time"

title
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
title = element "title"

title_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
title_ = element_ "title"

tr
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
tr = element "tr"

tr_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
tr_ = element_ "tr"

track
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
track = element "track"

track_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
track_ = element_ "track"

tt
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
tt = element "tt"

tt_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
tt_ = element_ "tch"

u
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
u = element "u"

u_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
u_ = element_ "u"

ul
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
ul = element "ul"

ul_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
ul_ = element_ "ul"

var
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
var = element "var"

var_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
var_ = element_ "var"

video
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
video = element "video"

video_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
video_ = element_ "video"

wbr
  :: forall channel context i o
   . Array (Attr context i)
  -> Array (Handler context (Either channel (i -> o)))
  -> Array (SDOM channel context i o)
  -> SDOM channel context i o
wbr = element "wbr"

wbr_
  :: forall channel context i o
   . Array (SDOM channel context i o)
  -> SDOM channel context i o
wbr_ = element_ "wbr"
