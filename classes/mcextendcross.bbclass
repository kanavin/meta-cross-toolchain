python mcextend_virtclass_handler () {
    cls = e.data.getVar("BBEXTENDCURR")
    variant = e.data.getVar("BBEXTENDVARIANT")
    if cls != "mcextendcross" or not variant:
        return

    override = ":virtclass-mcextendcross-" + variant

    e.data.setVar("MCNAME", variant)
    e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + override)
}

addhandler mcextend_virtclass_handler
mcextend_virtclass_handler[eventmask] = "bb.event.RecipePreFinalise"

