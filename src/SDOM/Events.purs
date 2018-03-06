module SDOM.Events where

import SDOM
import DOM.Event.Event as Event

change
  :: forall context e
  . (context -> Event.Event -> e)
  -> Handler context e
change = handler "change"

click
  :: forall context e
  . (context -> Event.Event -> e)
  -> Handler context e
click = handler "click"
