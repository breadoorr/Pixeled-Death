var ui_layer = layer_get_id("UILayer_1");
if (layer_exists(ui_layer)) {
    layer_set_visible(ui_layer, true);
}

window_set_cursor(cr_none)
cursor_sprite = MENU_COURSOR