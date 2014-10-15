# Debugger start #
class Debugger
    debug = false
    instance = null
    instanced = false
    extend = (obj) ->
        return obj unless (typeof obj) is 'object'
        i = 1
        length = arguments.length

        while i < length
            source = arguments[i]
            for prop of source
                obj[prop] = source[prop]  if hasOwnProperty.call(source, prop)
            i++
        return obj

    constructor: ->
        if instanced is true then return instance
        instance = this
        instanced = true

    enable: ->
        debug = if console then true else false
        return @

    disable: ->
        debug = false
        return @

    styles: {
        colors: {
            aqua: '#7FDBFF'
            blue: '#0074D9'
            navy: '#001F3F'
            teal: '#39CCCC'
            green: '#2ECC40'
            olive: '#3D9970'
            lime: '#01FF70'
            yellow: '#FFDC00'
            orange: '#FF851B'
            red: '#FF4136'
            fuchsia: '#F012BE'
            purple: '#B10DC9'
            maroon: '#85144B'
            white: '#fff'
            silver: '#ddd'
            gray: '#aaa'
            black: '#111'
        }
        sizes: {
            xxs: 'xx-small'
            xs: 'x-small'
            s: 'small'
            m: 'medium'
            l: 'large'
            xl: 'x-large'
            xxl: 'xx-large'
        }
        style_sets: {
            warn: 'background: #DA251D; color: white;font-weight: bold; font-size: x-large; border-radius: 5px; padding: 0.2em; line-height:2;'
            cmd: 'background: #000; color: #05A805; font-weight: bold; font-size: large; font-family:Courier; border-radius: 5px; padding: 0.2em; line-height:2;'
        }
    }

    log: ()->
        if debug is false then return this

        if arguments.length is 2 and typeof arguments[1] is 'string'
            last_arg = arguments[1]
            last_arg_arr = last_arg.split('-')

            if last_arg_arr.length is 2
                color = last_arg_arr[0]
                size = last_arg_arr[1]
                font_size = ''
                if @styles.colors.hasOwnProperty(color)
                    if size and @styles.sizes.hasOwnProperty(size)
                        font_size = 'font-size:'
                        if /^\d.*$/.test(size) then font_size += size + 'px;' else font_size += @styles.sizes[size] + ';'
                    style_string = "color:#{@styles.colors[color]};" + font_size
            else
                if @styles.style_sets.hasOwnProperty(last_arg) then style_string = @styles.style_sets[last_arg]
                if @styles.colors.hasOwnProperty(last_arg) then style_string = "color:#{@styles.colors[last_arg]};"
            if style_string
                console.log('%c' + arguments[0], style_string)
                return @

        console.log.apply(console, arguments)
        return this

    set: (style, obj)->
        if style is 'style' then @styles.style_sets = extend(@styles.style_sets,obj)
        if style is 'color' then @styles.colors = extend(@styles.colors,obj)
        return this

# Debugger end #
db = new Debugger()
window.log = ()->
    db.log.apply(db, arguments)

window.log.enable = ()-> db.enable()
window.log.disable = ()-> db.disable()
window.log.set = ()-> db.set.apply(db,arguments)
