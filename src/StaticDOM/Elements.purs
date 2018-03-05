module StaticDOM.Elements where

import StaticDOM
import Data.Either (Either)

a
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
a = element "a"

a_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
a_ = element_ "a"

abbr
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
abbr = element "abbr"

abbr_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
abbr_ = element_ "abbr"

acronym
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
acronym = element "acronym"

acronym_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
acronym_ = element_ "acronym"

address
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
address = element "address"

address_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
address_ = element_ "address"

applet
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
applet = element "applet"

applet_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
applet_ = element_ "applet"

area
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
area = element "area"

area_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
area_ = element_ "area"

article
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
article = element "article"

article_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
article_ = element_ "article"

aside
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
aside = element "aside"

aside_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
aside_ = element_ "aside"

audio
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
audio = element "audio"

audio_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
audio_ = element_ "audich"

b
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
b = element "b"

b_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
b_ = element_ "b"

base
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
base = element "base"

base_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
base_ = element_ "base"

basefont
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
basefont = element "basefont"

basefont_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
basefont_ = element_ "basefont"

bdi
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
bdi = element "bdi"

bdi_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
bdi_ = element_ "bdi"

bdo
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
bdo = element "bdo"

bdo_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
bdo_ = element_ "bdo"

big
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
big = element "big"

big_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
big_ = element_ "big"

blockquote
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
blockquote = element "blockquote"

blockquote_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
blockquote_ = element_ "blockquote"

body
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
body = element "body"

body_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
body_ = element_ "body"

br
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
br = element "br"

br_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
br_ = element_ "br"

button
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
button = element "button"

button_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
button_ = element_ "button"

canvas
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
canvas = element "canvas"

canvas_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
canvas_ = element_ "canvas"

caption
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
caption = element "caption"

caption_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
caption_ = element_ "caption"

center
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
center = element "center"

center_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
center_ = element_ "center"

cite
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
cite = element "cite"

cite_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
cite_ = element_ "cite"

code
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
code = element "code"

code_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
code_ = element_ "code"

col
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
col = element "col"

col_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
col_ = element_ "col"

colgroup
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
colgroup = element "colgroup"

colgroup_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
colgroup_ = element_ "colgroup"

datalist
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
datalist = element "datalist"

datalist_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
datalist_ = element_ "datalist"

dd
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
dd = element "dd"

dd_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
dd_ = element_ "dd"

del
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
del = element "del"

del_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
del_ = element_ "del"

details
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
details = element "details"

details_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
details_ = element_ "details"

dfn
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
dfn = element "dfn"

dfn_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
dfn_ = element_ "dfn"

dialog
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
dialog = element "dialog"

dialog_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
dialog_ = element_ "dialog"

dir
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
dir = element "dir"

dir_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
dir_ = element_ "dir"

div
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
div = element "div"

div_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
div_ = element_ "div"

dl
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
dl = element "dl"

dl_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
dl_ = element_ "dl"

dt
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
dt = element "dt"

dt_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
dt_ = element_ "dt"

em
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
em = element "em"

em_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
em_ = element_ "em"

embed
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
embed = element "embed"

embed_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
embed_ = element_ "embed"

fieldset
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
fieldset = element "fieldset"

fieldset_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
fieldset_ = element_ "fieldset"

figcaption
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
figcaption = element "figcaption"

figcaption_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
figcaption_ = element_ "figcaption"

figure
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
figure = element "figure"

figure_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
figure_ = element_ "figure"

font
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
font = element "font"

font_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
font_ = element_ "font"

footer
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
footer = element "footer"

footer_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
footer_ = element_ "footer"

form
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
form = element "form"

form_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
form_ = element_ "form"

frame
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
frame = element "frame"

frame_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
frame_ = element_ "frame"

frameset
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
frameset = element "frameset"

frameset_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
frameset_ = element_ "frameset"

h1
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
h1 = element "h1"

h1_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
h1_ = element_ "h1"

head
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
head = element "head"

head_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
head_ = element_ "head"

header
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
header = element "header"

header_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
header_ = element_ "header"

hr
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
hr = element "hr"

hr_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
hr_ = element_ "hr"

html
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
html = element "html"

html_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
html_ = element_ "htmch"

i
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
i = element "i"

i_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
i_ = element_ "i"

iframe
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
iframe = element "iframe"

iframe_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
iframe_ = element_ "iframe"

img
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
img = element "img"

img_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
img_ = element_ "img"

input
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
input = element "input"

input_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
input_ = element_ "input"

ins
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
ins = element "ins"

ins_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
ins_ = element_ "ins"

kbd
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
kbd = element "kbd"

kbd_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
kbd_ = element_ "kbd"

label
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
label = element "label"

label_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
label_ = element_ "label"

legend
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
legend = element "legend"

legend_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
legend_ = element_ "legend"

li
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
li = element "li"

li_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
li_ = element_ "li"

link
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
link = element "link"

link_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
link_ = element_ "link"

main
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
main = element "main"

main_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
main_ = element_ "main"

map
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
map = element "map"

map_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
map_ = element_ "map"

mark
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
mark = element "mark"

mark_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
mark_ = element_ "mark"

menu
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
menu = element "menu"

menu_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
menu_ = element_ "menu"

menuitem
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
menuitem = element "menuitem"

menuitem_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
menuitem_ = element_ "menuitem"

meta
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
meta = element "meta"

meta_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
meta_ = element_ "meta"

meter
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
meter = element "meter"

meter_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
meter_ = element_ "meter"

nav
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
nav = element "nav"

nav_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
nav_ = element_ "nav"

noframes
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
noframes = element "noframes"

noframes_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
noframes_ = element_ "noframes"

noscript
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
noscript = element "noscript"

noscript_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
noscript_ = element_ "noscript"

object
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
object = element "object"

object_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
object_ = element_ "object"

ol
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
ol = element "ol"

ol_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
ol_ = element_ "ol"

optgroup
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
optgroup = element "optgroup"

optgroup_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
optgroup_ = element_ "optgroup"

option
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
option = element "option"

option_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
option_ = element_ "option"

output
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
output = element "output"

output_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
output_ = element_ "outpuch"

p
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
p = element "p"

p_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
p_ = element_ "p"

param
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
param = element "param"

param_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
param_ = element_ "param"

picture
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
picture = element "picture"

picture_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
picture_ = element_ "picture"

pre
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
pre = element "pre"

pre_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
pre_ = element_ "pre"

progress
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
progress = element "progress"

progress_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
progress_ = element_ "progresch"

q
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
q = element "q"

q_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
q_ = element_ "q"

rp
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
rp = element "rp"

rp_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
rp_ = element_ "rp"

rt
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
rt = element "rt"

rt_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
rt_ = element_ "rt"

ruby
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
ruby = element "ruby"

ruby_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
ruby_ = element_ "rubch"

s
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
s = element "s"

s_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
s_ = element_ "s"

samp
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
samp = element "samp"

samp_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
samp_ = element_ "samp"

script
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
script = element "script"

script_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
script_ = element_ "script"

section
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
section = element "section"

section_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
section_ = element_ "section"

select
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
select = element "select"

select_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
select_ = element_ "select"

small
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
small = element "small"

small_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
small_ = element_ "small"

source
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
source = element "source"

source_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
source_ = element_ "source"

span
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
span = element "span"

span_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
span_ = element_ "span"

strike
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
strike = element "strike"

strike_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
strike_ = element_ "strike"

strong
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
strong = element "strong"

strong_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
strong_ = element_ "strong"

style
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
style = element "style"

style_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
style_ = element_ "style"

sub
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
sub = element "sub"

sub_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
sub_ = element_ "sub"

summary
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
summary = element "summary"

summary_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
summary_ = element_ "summary"

sup
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
sup = element "sup"

sup_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
sup_ = element_ "sup"

table
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
table = element "table"

table_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
table_ = element_ "table"

tbody
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
tbody = element "tbody"

tbody_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
tbody_ = element_ "tbody"

td
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
td = element "td"

td_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
td_ = element_ "td"

template
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
template = element "template"

template_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
template_ = element_ "template"

textarea
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
textarea = element "textarea"

textarea_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
textarea_ = element_ "textarea"

tfoot
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
tfoot = element "tfoot"

tfoot_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
tfoot_ = element_ "tfoot"

th
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
th = element "th"

th_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
th_ = element_ "th"

thead
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
thead = element "thead"

thead_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
thead_ = element_ "thead"

time
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
time = element "time"

time_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
time_ = element_ "time"

title
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
title = element "title"

title_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
title_ = element_ "title"

tr
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
tr = element "tr"

tr_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
tr_ = element_ "tr"

track
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
track = element "track"

track_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
track_ = element_ "track"

tt
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
tt = element "tt"

tt_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
tt_ = element_ "tch"

u
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
u = element "u"

u_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
u_ = element_ "u"

ul
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
ul = element "ul"

ul_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
ul_ = element_ "ul"

var
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
var = element "var"

var_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
var_ = element_ "var"

video
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
video = element "video"

video_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
video_ = element_ "video"

wbr
  :: forall ch ctx i o
   . Array (ctx -> Attr i)
  -> Array (ctx -> Handler (Either ch (i -> o)))
  -> Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
wbr = element "wbr"

wbr_
  :: forall ch ctx i o
   . Array (StaticDOM ch ctx i o)
  -> StaticDOM ch ctx i o
wbr_ = element_ "wbr"
