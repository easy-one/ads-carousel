         <!DOCTYPE html>
<html>
<head>
    <title>AD Template</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<body>
<script type="text/javascript">
//    JSON Data for templates
var jsonData = {
    template: [
        {% for im in images %}
            {
                img: "{{ im.rel_path }}",
                animation: {
                    startPosition: { x: {{ im.start_x }}, y: {{ im.start_y }} },
                    startScale: {{ im.initial_scale }},
                    endPosition: { x: {{ im.end_x }}, y: {{ im.end_y }} },
                    endScale: {{ im.final_scale }},
                    showTime: {{ im.showtime }},
                }
            },
        {% endfor %}
    ],
    logoImg: "{{ logos[0].rel_path }}",
    logoBackground: "{{ logos[0].background_color }}",
    logoAction: "#",
    headline: "{{ headline.text }}",
    rate: [5],
    actionLink: "{{ destination_url }}",
    actionName: "{{ button_text }}"
};

var starImage = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAeCAYAAADzXER0AAAACXBIWXMAAAsTAAALEwEAmpwYAAAKT2lDQ1BQaG90b3Nob3AgSUNDIHByb2ZpbGUAAHjanVNnVFPpFj333vRCS4iAlEtvUhUIIFJCi4AUkSYqIQkQSoghodkVUcERRUUEG8igiAOOjoCMFVEsDIoK2AfkIaKOg6OIisr74Xuja9a89+bN/rXXPues852zzwfACAyWSDNRNYAMqUIeEeCDx8TG4eQuQIEKJHAAEAizZCFz/SMBAPh+PDwrIsAHvgABeNMLCADATZvAMByH/w/qQplcAYCEAcB0kThLCIAUAEB6jkKmAEBGAYCdmCZTAKAEAGDLY2LjAFAtAGAnf+bTAICd+Jl7AQBblCEVAaCRACATZYhEAGg7AKzPVopFAFgwABRmS8Q5ANgtADBJV2ZIALC3AMDOEAuyAAgMADBRiIUpAAR7AGDIIyN4AISZABRG8lc88SuuEOcqAAB4mbI8uSQ5RYFbCC1xB1dXLh4ozkkXKxQ2YQJhmkAuwnmZGTKBNA/g88wAAKCRFRHgg/P9eM4Ors7ONo62Dl8t6r8G/yJiYuP+5c+rcEAAAOF0ftH+LC+zGoA7BoBt/qIl7gRoXgugdfeLZrIPQLUAoOnaV/Nw+H48PEWhkLnZ2eXk5NhKxEJbYcpXff5nwl/AV/1s+X48/Pf14L7iJIEyXYFHBPjgwsz0TKUcz5IJhGLc5o9H/LcL//wd0yLESWK5WCoU41EScY5EmozzMqUiiUKSKcUl0v9k4t8s+wM+3zUAsGo+AXuRLahdYwP2SycQWHTA4vcAAPK7b8HUKAgDgGiD4c93/+8//UegJQCAZkmScQAAXkQkLlTKsz/HCAAARKCBKrBBG/TBGCzABhzBBdzBC/xgNoRCJMTCQhBCCmSAHHJgKayCQiiGzbAdKmAv1EAdNMBRaIaTcA4uwlW4Dj1wD/phCJ7BKLyBCQRByAgTYSHaiAFiilgjjggXmYX4IcFIBBKLJCDJiBRRIkuRNUgxUopUIFVIHfI9cgI5h1xGupE7yAAygvyGvEcxlIGyUT3UDLVDuag3GoRGogvQZHQxmo8WoJvQcrQaPYw2oefQq2gP2o8+Q8cwwOgYBzPEbDAuxsNCsTgsCZNjy7EirAyrxhqwVqwDu4n1Y8+xdwQSgUXACTYEd0IgYR5BSFhMWE7YSKggHCQ0EdoJNwkDhFHCJyKTqEu0JroR+cQYYjIxh1hILCPWEo8TLxB7iEPENyQSiUMyJ7mQAkmxpFTSEtJG0m5SI+ksqZs0SBojk8naZGuyBzmULCAryIXkneTD5DPkG+Qh8lsKnWJAcaT4U+IoUspqShnlEOU05QZlmDJBVaOaUt2ooVQRNY9aQq2htlKvUYeoEzR1mjnNgxZJS6WtopXTGmgXaPdpr+h0uhHdlR5Ol9BX0svpR+iX6AP0dwwNhhWDx4hnKBmbGAcYZxl3GK+YTKYZ04sZx1QwNzHrmOeZD5lvVVgqtip8FZHKCpVKlSaVGyovVKmqpqreqgtV81XLVI+pXlN9rkZVM1PjqQnUlqtVqp1Q61MbU2epO6iHqmeob1Q/pH5Z/YkGWcNMw09DpFGgsV/jvMYgC2MZs3gsIWsNq4Z1gTXEJrHN2Xx2KruY/R27iz2qqaE5QzNKM1ezUvOUZj8H45hx+Jx0TgnnKKeX836K3hTvKeIpG6Y0TLkxZVxrqpaXllirSKtRq0frvTau7aedpr1Fu1n7gQ5Bx0onXCdHZ4/OBZ3nU9lT3acKpxZNPTr1ri6qa6UbobtEd79up+6Ynr5egJ5Mb6feeb3n+hx9L/1U/W36p/VHDFgGswwkBtsMzhg8xTVxbzwdL8fb8VFDXcNAQ6VhlWGX4YSRudE8o9VGjUYPjGnGXOMk423GbcajJgYmISZLTepN7ppSTbmmKaY7TDtMx83MzaLN1pk1mz0x1zLnm+eb15vft2BaeFostqi2uGVJsuRaplnutrxuhVo5WaVYVVpds0atna0l1rutu6cRp7lOk06rntZnw7Dxtsm2qbcZsOXYBtuutm22fWFnYhdnt8Wuw+6TvZN9un2N/T0HDYfZDqsdWh1+c7RyFDpWOt6azpzuP33F9JbpL2dYzxDP2DPjthPLKcRpnVOb00dnF2e5c4PziIuJS4LLLpc+Lpsbxt3IveRKdPVxXeF60vWdm7Obwu2o26/uNu5p7ofcn8w0nymeWTNz0MPIQ+BR5dE/C5+VMGvfrH5PQ0+BZ7XnIy9jL5FXrdewt6V3qvdh7xc+9j5yn+M+4zw33jLeWV/MN8C3yLfLT8Nvnl+F30N/I/9k/3r/0QCngCUBZwOJgUGBWwL7+Hp8Ib+OPzrbZfay2e1BjKC5QRVBj4KtguXBrSFoyOyQrSH355jOkc5pDoVQfujW0Adh5mGLw34MJ4WHhVeGP45wiFga0TGXNXfR3ENz30T6RJZE3ptnMU85ry1KNSo+qi5qPNo3ujS6P8YuZlnM1VidWElsSxw5LiquNm5svt/87fOH4p3iC+N7F5gvyF1weaHOwvSFpxapLhIsOpZATIhOOJTwQRAqqBaMJfITdyWOCnnCHcJnIi/RNtGI2ENcKh5O8kgqTXqS7JG8NXkkxTOlLOW5hCepkLxMDUzdmzqeFpp2IG0yPTq9MYOSkZBxQqohTZO2Z+pn5mZ2y6xlhbL+xW6Lty8elQfJa7OQrAVZLQq2QqboVFoo1yoHsmdlV2a/zYnKOZarnivN7cyzytuQN5zvn//tEsIS4ZK2pYZLVy0dWOa9rGo5sjxxedsK4xUFK4ZWBqw8uIq2Km3VT6vtV5eufr0mek1rgV7ByoLBtQFr6wtVCuWFfevc1+1dT1gvWd+1YfqGnRs+FYmKrhTbF5cVf9go3HjlG4dvyr+Z3JS0qavEuWTPZtJm6ebeLZ5bDpaql+aXDm4N2dq0Dd9WtO319kXbL5fNKNu7g7ZDuaO/PLi8ZafJzs07P1SkVPRU+lQ27tLdtWHX+G7R7ht7vPY07NXbW7z3/T7JvttVAVVN1WbVZftJ+7P3P66Jqun4lvttXa1ObXHtxwPSA/0HIw6217nU1R3SPVRSj9Yr60cOxx++/p3vdy0NNg1VjZzG4iNwRHnk6fcJ3/ceDTradox7rOEH0x92HWcdL2pCmvKaRptTmvtbYlu6T8w+0dbq3nr8R9sfD5w0PFl5SvNUyWna6YLTk2fyz4ydlZ19fi753GDborZ752PO32oPb++6EHTh0kX/i+c7vDvOXPK4dPKy2+UTV7hXmq86X23qdOo8/pPTT8e7nLuarrlca7nuer21e2b36RueN87d9L158Rb/1tWeOT3dvfN6b/fF9/XfFt1+cif9zsu72Xcn7q28T7xf9EDtQdlD3YfVP1v+3Njv3H9qwHeg89HcR/cGhYPP/pH1jw9DBY+Zj8uGDYbrnjg+OTniP3L96fynQ89kzyaeF/6i/suuFxYvfvjV69fO0ZjRoZfyl5O/bXyl/erA6xmv28bCxh6+yXgzMV70VvvtwXfcdx3vo98PT+R8IH8o/2j5sfVT0Kf7kxmTk/8EA5jz/GMzLdsAAAAgY0hSTQAAeiUAAICDAAD5/wAAgOkAAHUwAADqYAAAOpgAABdvkl/FRgAABTpJREFUeNps1Hts3WUdx/H39/ldzvn1nN9pVzqsK4PuwrrV4qawujW7SJwBnYpLHGMx+ocRI8oIhoDGf0iMYlgMGgHxghFjhD+sixOi8zKNINkcMsmcxXaXtnNdr6c7Oz2X3+15Hv9o6ED8/vvk9Tyfb/J9vnLmYCelvjtp3/Zl0isXwGpE+R2zhz/1x7G4++uzy24b9E2VpglY1zhEWzRElDoAuG7YycLpZ4knT9K6+R6UV6Bx9nfvSefPbzRZ2h+Y/CBpndDxKeRraPEBDYCyRqP8kKx6Eb9jPcWejxAvTO2uVVPC6PzuI7863H7090d5t3oJ3y6gyfFGuQCiPEzaYPa399Oyakcpnj83IA4UfHrFoSdocY/5LW1EsQLMEpbRJ2/aI1Yrm8UKbN344faoMvWgG0872gpRpg6FYeFZ5bca5XrG6qiVpPkPYFzOPdY9SVLptOIijkecZGSNy+QcDSJYC7gBXq6ANoZqIyFOzOeB5129vH9P/dyRZ7x0rsdxQAE5R0BkMZpYlI1BK2bmo+qLI+lXnv+n/EBbUHHYe7xceN+2qM4LaQai1BJcxCBujtcnGT11UX8g0Tx1uQHlGiglFs+VOfLsdVqu+RkIYJewpxQzlXT8+NnGh1Mtf3eUEGuINbirt97FqoH92GY5mjz8OSebKeO6ssSNtSRJatYuJ7o2FC7MC5u6LJkB15RPo9wAnaXXmrSx2RjQRuG7FoOAhVIgqzoS8/5q0z7TURA+s1VAwJ17+TsgCjFZP3FldVM7jEzJX148ox/atcH5dN8K9cVizlJP2DBahrx3tSXXrL8b8UPs6cf3Ts9cdk5Nqu83Uh4oBdL4ycv6xLYb7Wv7bpbvrmzjkwWfb7uKqSU8MpWAlxCWk+j1SzxwfNQ+tr9f2HmjMPgq1BOeHp5xTk4vqK9qrVtFZArAWnBfPTWCchTd9dp9iSXtfadlY5dVE/Nm123vkvE4ZfilUXXy+Jj6hNWWKLV4ruA6grs8aDKt1lGv+HFvJ1zXDkmGa73it6qp+XlRNR7tajM0U8FD03VNwKYVGZ2hxh1wfsMQV1hWKHO9A0pBnNmulu7NPbo2vbE5M0RrLmPrKkU+X2JHXwduOkcWN3BbpMZ2OURScomSgCxqooLCHcu23Oc3zh/dPTs2tKZUsuf23BKAU6SmIUosNgOlcajbVmLjgfKwBtywa6C4/uME3dtLyudmbRXV2KPaTN88fLiI2mWSqp/Vah6WNL3CuvatH9oJ0NJ9K/6y678QTVyIbDaTiedpKXoBqLOITMiZR8ILxd69K1tu2IGOKogIYd8+nMI7AKifPUI8/RpOvh2TxdSHD9MY/+tBm8W/dHW0cEc08crTbZvveW9+xS38bxXW3k5h7e0AVE48STz77x/bNH4EuOIcuFWmkvnp5+rDh5Y7Qev/vQAdM/Xrz9bnjn7zALb5sGBiEVAgOIFaSOfLd18avPeJxtif32ZnjnypcfnYT/cpjx9iMhAFolCw+H3FAy/MXVRO7m1Y5UJH5VgQ961nixiLzXDz1235aH7lACauUfnbE9RHXgCguH5PDsUmk8WLr17FFqxFFGuCG3au1s15Jp772PSlwQN3XfrFnY9WXvkeXvsach09W2z61kQy8jUfTIb4xQfDm/YfbP7n2B+aY6fuF58h5ShMavYXez74I/GCQuP8n/pULvzXVfyN4hub7nGbJDlruVe5NrFpgvgBJklAqw1useUpkzYfQtSJJTz88FKKEpa6uL621ipM2g9MImp8sTODyJuXo/DfAQBzzG8Jrs4dGAAAAABJRU5ErkJggg==";
var whiteArrow="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABYAAAAWCAYAAAGzs1ytAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyRpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoTWFjaW50b3NoKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo2OUUyN0IwQTAxMUExMUUzODFEQkZDRjZBMTdGQzIwMyIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo2OUUyN0IwQjAxMUExMUUzODFEQkZDRjZBMTdGQzIwMyI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjY5RTI3QjA4MDExQTExRTM4MURCRkNGNkExN0ZDMjAzIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjY5RTI3QjA5MDExQTExRTM4MURCRkNGNkExN0ZDMjAzIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+ftC3EQAAAWBJREFUeNpi/P//PwMMMEHp/8gcMAAIIEZsylwgioEyQCwMogECCEUZMkA2LBVqAyuGwcgAIICwSjDhM9saai4jsrNAGAScwcZBBbiBOBqmAKtFAAGE01mEPAcCklCHRMMdgwyQHAbCIJti/yOAHVSMAdnBMByNpNAbiAWR5bG5mReI2YD4HSxWYQAggCjyIO0UX4a6k4OYJPET6rnfQMwDxL/wmcwHDQVQqnsKS324FINM5oSyPwCxIL4YhIH3QKwCxCzI8uiKDwDxPyBWB2JWNDkMDzIDsSgQv4c6ifwkChBgJCmmWWxT02BQlBwG4jxoXDISbTJ6qCPhBf8xgR8QsyNnSlwYnyQoTQRiMfwzEFsDMRs+CxgI2MwIdeFaLBYsAWIBIGYmx+BoLAY+BWIXIFYCYn5yDJ6LZuB3IA4CYlUgFkLPPoRyCHqKAeXyJUC8G4h3QHP8R2gR8X94ZRAAlSVgUcUVa3EAAAAASUVORK5CYII=";
var yellowArrow="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABYAAAAWCAYAAAGzs1ytAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyRpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoTWFjaW50b3NoKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo2OUUyN0IwRTAxMUExMUUzODFEQkZDRjZBMTdGQzIwMyIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo2OUUyN0IwRjAxMUExMUUzODFEQkZDRjZBMTdGQzIwMyI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjY5RTI3QjBDMDExQTExRTM4MURCRkNGNkExN0ZDMjAzIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjY5RTI3QjBEMDExQTExRTM4MURCRkNGNkExN0ZDMjAzIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+8N5Y8AAAAhlJREFUeNpi/P//PwMMsICIV11a/wXF2RiZGJAAQAAxIisDy3yYqOMC53ALsJwH0QABhKIMGbDAGK+7tVKBamYBbWBjjb/wG6cOgADCKsGE0+w3PVrW//4xHAGaywQ09z9YJb8o21EQ/evHPye49h9f/3Jz8jDHsHEw7cVpEUAA4XQWXs9Bg08SSD1jYWWM4RViXQZkg00COgrTC0DXvgAqjPvz+/+S9y9//fv64Y8dyHasJn94+SsKaNQiEJtHgMWHlZ3pMsx0DMUC4mxLgdQmIGYD4nfICkEAIIBI8iATAwmAJMXoQQfykA4wVDhBEYUcbNhMVgMRwGD7BPUkbmcATeRjhIQCKzAYn4JofG7+CQwbTkg4MXwA6cfpZqD1/yHqGD4IiLF5QsMau8mMjAwHQREBjBwLIP0QiP/gNBlomjOQEgVZAsS/KUqiAAFGkmKaxTbZKQMZ/F5oAAp1UJRsAgboamA4TYcGJIYXkVMPQRcDDV0AjT4bYGhNBPJ/ffnwxxfIZ0fOlCQHBTD1pQBzeRCKL37+2wi04M3Xj3+soMmXkZww/gMsYzYALeAABsU6JHEeYJl35OObX/NAxSAQM5MUxuDi5hWwuPnPsAQtAT8DFj3xLGxM97CFN0GDgYbOBRqahCT0g4uPJZqdE1yWvQXiT+i5giiDgakg9d/f/8Wf3v1ewsrGtJubn2UHNDI/QnPP/+GVQQDuy8YEW/LjNQAAAABJRU5ErkJggg==";

var pluginName = 'Kenburns',
        defaults = {
            images:[],
            animation: [],
            fadeSpeed:500,
            ease3d:'cubic-bezier(.81, 0, .26, 1)',
            onLoadingComplete:function(){},
            onSlideComplete:function(){},
            onListComplete:function(){},
            getSlideIndex:function(){
                return currentSlide;
            }
        };

var imagesObj = {};
var currentSlide = 0;

function Plugin( element, options ) {
    this.element = element;
    this.options = $.extend( {}, defaults, options) ;
    this._defaults = defaults;
    this._name = pluginName;
    this.maxSlides = this.options.images.length;

    this.init();
}


/*  1. Initialization
 ------------------------------------------------------------------------------------------------- */
/**
 * Init
 * Initial setup - dermines width, height, and adds the loading icon.
 */
Plugin.prototype.init = function () {

    var list = this.options.images;
    var that = this;

    this.width = $(this.element).width();
    this.height = $(this.element).height();

    this.has3d = has3DTransforms();

    for (i in list) {
        imagesObj["image"+i] = {};
        imagesObj["image"+i].loaded = false;
        this.attachImage(list[i], "image"+i , i);

    }

    var loader = $('<div/>');
    loader.addClass('loader');
    loader.css({'position':'absolute','z-index':10000});
    $(this.element).prepend(loader);
};



/*  2. Loading and Setup
 ------------------------------------------------------------------------------------------------- */

/**
 * Attach image
 * creates a wrapper div for the image along with the image tag. The reason for the additional
 * wrapper is that we are transitioning multiple properties at the same time: scale, position, and
 * opacity. But we want opacity to finish first. This function also determines if the browser
 * has 3d transform capabilities and initializes the starting CSS values.
 */
Plugin.prototype.attachImage = function(url,alt_text,index) {
    var that = this;

    //put the image in an empty div to separate the animation effects of fading and moving
    var wrapper = $('<div/>');
    wrapper.attr('class','kb-slide');
    wrapper.css({'opacity':0}, {'position': 'absolute'}, {'z-index': 1});


    var img = $("<img />");
    img.attr('src', url);
    img.attr('alt', alt_text);
    img.css({'position':'relative'}, {'-webkit-transform': 'translate3d(0,0,0)'}, {'-ms-transform': 'translate3d(0,0,0)'}, {'transform': 'translate3d(0,0,0)'}, {'-moz-transform': 'translate3d(0,0,0)'});

    wrapper.html(img);

    //First check if the browser supports 3D transitions, initialize the CSS accordingly
    if(this.has3d) {
        img.css({'-webkit-transform-origin':'left top'});
        img.css({'-ms-transform-origin':'left top'});
        img.css({'transform-origin':'left top'});
        img.css({'-moz-transform-origin':'left top'});
        img.css({'-webkit-transform':'scale('+that.options.animation[index].startScale+') translate3d(0,0,0)'});
        img.css({'-ms-transform':'scale('+that.options.animation[index].startScale+') translate3d(0,0,0)'});
        img.css({'transform':'scale('+that.options.animation[index].startScale+') translate3d(0,0,0)'});
        img.css({'-moz-transform':'scale('+that.options.animation[index].startScale+') translate3d(0,0,0)'});
    }

    //Switch the transition to the 3d version if it does exist
    this.doTransition = (this.has3d)?this.transition3d:this.transition;

    //set up the image OBJ parameters - used to track loading and initial dimensions
    img.load(function() {
        imagesObj["image"+index].element = this;
        imagesObj["image"+index].loaded  = true;
        imagesObj["image"+index].width = $(this).width();
        imagesObj["image"+index].height = $(this).height();
        that.insertAt(index,wrapper);
        that.resume(index);
    });

}

/**
 * Resume
 * Resume will continue the transition after the stalled image loads
 * it also fires the complete action when the series of images finishes loading
 */
Plugin.prototype.resume = function(index){

    //first image has loaded
    if(index == 0) {
        this.startTransition(0);
        $(this.element).find('.loader').hide();

    }

    //if the next image hasnt loaded yet, but the transition has started,
    // this will match the image index to the image holding the transition.
    // it will then resume the transition.
    if(index == this.holdup) {
        $('#status').html("");
        $(this.element).find('.loader').hide();
        this.startTransition(this.holdup);
    }

    //if the last image in the set has loaded, add the images in order
    if(this.checkLoadProgress() == true) {
        //reset the opacities and z indexes except the last and first images
        $(this.element).find('.stalled').each(function(){
            $(this).css({'opacity':1,'z-index':1});
            $(this).removeClass('stalled');
        });

        //fire the complete thing
        this.options.onLoadingComplete();
    }
}

//if any of the slides are not loaded, the set has not finished loading.
Plugin.prototype.checkLoadProgress = function() {
    var imagesLoaded = true;
    for(i=0;i<this.maxSlides;i++){
        if (imagesObj["image"+i].loaded == false){
            imagesLoaded = false;
        }
    }
    return imagesLoaded;
}

/**
 * Wait
 * Stops the transition interval, shows the loader and
 * applies the stalled class to the visible image.
 */
Plugin.prototype.wait = function() {
    clearInterval(this.interval);
    $('#status').html("loading");
    $(this.element).find('.loader').show();

    var image = imagesObj["image"+(currentSlide-1)].element;
    $(image).parent().stop(true,true);
    $(image).parent().addClass('stalled');
}



/* 3. Transitions and Movement
 ------------------------------------------------------------------------------------------------- */

/**
 * startTransition
 * Begins the Gallery Transition and tracks the current slide
 * Also manages loading - if the interval encounters a slide
 * that has not loaded, the transition pauses.
 */
Plugin.prototype.startTransition = function(start_index) {
    var that = this;
    currentSlide = start_index; //current slide

    that.doTransition();
    this.interval = setTimeout(function(){

        //Advance the current slide
        if(currentSlide < that.maxSlides-1){
            currentSlide++;
        }else {
            currentSlide = 0;
        }

        //Check if the next slide is loaded. If not, wait.
        if(imagesObj["image"+currentSlide].loaded == false){
            that.holdup = currentSlide;
            that.wait();

            //if the next slide is loaded, go ahead and do the transition.
        }else {
            that.startTransition(currentSlide);
        }
    },this.options.animation[currentSlide].showTime + 1500);
}


/**
 * chooseCorner
 * This function chooses a random start corner and a random end corner
 * that is different from the start. This gives a random direction effect
 * it returns coordinates used by the transition functions.
 */

Plugin.prototype.chooseCorner = function() {
    var scale = this.options.animation[currentSlide].startScale;
    var endScale = this.options.animation[currentSlide].endScale;
    var image = imagesObj["image"+currentSlide].element;

    var width = 548;
    var height = 90;

    start = this.options.animation[currentSlide].startPosition;
    end = this.options.animation[currentSlide].endPosition;

    var w = $(this.element).width() - 180;
    var h = $(this.element).height();

    var coordinates = [];

    var imw = $(image).width();
    var imh = $(image).height();
    
    coordinates = {
        startX: start.x * (w/scale - imw),
        startY: start.y * (h/scale - imh),
        endX: end.x * (w/endScale - imw),
        endY: end.y * (h/endScale - imh)
    }
    
    //build the new coordinates from the chosen coordinates
    return coordinates;
}



/**
 *  Transiton3D
 *  Transition3d Function works by setting the webkit and moz translate3d properties. These
 *  are hardware accellerated and give a very smooth animation. Since only one animation
 *  can be applied at a time, I wrapped the images in a div. The shorter fade is applied to
 *  the parent, while the translation and scaling is applied to the image.
 */

Plugin.prototype.transition3d = function () {
    console.log("TRANSITION 3D")
    var that  = this;
    var scale = this.options.animation[currentSlide].startScale;
    var endScale = this.options.animation[currentSlide].endScale;
    var image = imagesObj["image"+currentSlide].element;
    var position = this.chooseCorner();

    var score = this.options.animation[currentSlide].score;
    $("#score").text("Score : " + score);

    //First clear any existing transition
    $(image).css({'-webkit-transition':'none'});
    $(image).css({'-ms-transition':'none'});
    $(image).css({'transition':'none'});
    $(image).css({'-moz-transition':'none'});
    $(image).css({'-webkit-transform':'scale('+scale+') translate3d('+position.startX+'px,'+position.startY+'px,0)'});
    $(image).css({'-ms-transform':'scale('+scale+') translate3d('+position.startX+'px,'+position.startY+'px,0)'});
    $(image).css({'transform':'scale('+scale+') translate3d('+position.startX+'px,'+position.startY+'px,0)'});
    $(image).css({'-moz-transform':'scale('+scale+') translate3d('+position.startX+'px,'+position.startY+'px,0)'});

    //Set the wrapper to fully transparent and start it's animation
    $(image).parent().css({'opacity':0,'z-index':'3'});
    $(image).parent().animate({'opacity':1},that.options.fadeSpeed);

    //Add the transition back in
    $(image).css({'-webkit-transition':'-webkit-transform '+(that.options.animation[currentSlide].showTime+that.options.fadeSpeed)+'ms '+that.options.ease3d});
    $(image).css({'-ms-transition':'-ms-transform '+(that.options.animation[currentSlide].showTime+that.options.fadeSpeed)+'ms '+that.options.ease3d});
    $(image).css({'transition':'transform '+(that.options.animation[currentSlide].showTime+that.options.fadeSpeed)+'ms '+that.options.ease3d});
    $(image).css({'-moz-transition':'-moz-transform '+(that.options.animation[currentSlide].showTime+that.options.fadeSpeed)+'ms '+that.options.ease3d});

    //set the end position and scale, which fires the transition
    $(image).css({'-webkit-transform':'scale(' + endScale + ') translate3d('+position.endX+'px,'+position.endY+'px,0)'});
    $(image).css({'-ms-transform':'scale(' + endScale + ') translate3d('+position.endX+'px,'+position.endY+'px,0)'});
    $(image).css({'-transform':'scale(' + endScale + ') translate3d('+position.endX+'px,'+position.endY+'px,0)'});
    $(image).css({'-moz-transform':'scale(' + endScale + ') translate3d('+position.endX+'px,'+position.endY+'px,0)'});

    setTimeout(function(){
        that.transitionOut();
        that.options.onSlideComplete();
    },1500)
}



/**
 *  Transition
 *  The regular JQuery animation function. Sets the currentSlide initial scale and position to
 *  the value from chooseCorner before triggering the animation. It starts the image moving to
 *  the new position, starts the fade on the wrapper, and delays the fade out animation. Adding
 *  fadeSpeed to duration gave me a nice crossfade so the image continues to move as it fades out
 *  rather than just stopping.
 */

Plugin.prototype.transition = function() {
    console.log("TRANSITION");
    var that  = this;
    var scale = this.options.scale;
    var endScale = this.options.animation[currentSlide].endScale;
    var image = imagesObj["image"+currentSlide].element;
    var sw = $(image).width();
    var sh = $(image).height();
    var position = this.chooseCorner();

    $(image).css({'left':position.startX,'top':position.startY,'width':sw*(scale),'height':sh*(scale)});
    $(image).animate({'left':position.endX,'top':position.endY,'width':sw,'height':sh}, that.options.animation[currentSlide].showTime + that.options.fadeSpeed);

    $(image).parent().css({'opacity':0,'z-index':3});
    $(image).parent().animate({'opacity':1},that.options.fadeSpeed);

    setTimeout(function(){
        that.transitionOut();
        that.options.onSlideComplete();
    },1500)
}

Plugin.prototype.transitionOut = function() {
    var that = this;
    var image = imagesObj["image"+currentSlide].element;
    $(image).parent().delay(that.options.animation[currentSlide].showTime).animate({'opacity':0},that.options.fadeSpeed, function(){
        $(this).css({'z-index':1});
    });
}



/* 4. Utility Functions
 ------------------------------------------------------------------------------------------------- */
/**
 *  has3DTransforms
 *  Tests the browser to determine support for Webkit and Moz Transforms
 *  Creates an element, translates the element, and tests the values. If the
 *  values return true, the browser supports 3D transformations.
 */
function has3DTransforms() {
    var el = document.createElement('div'),
            has3d,
            transforms = {
                'WebkitTransform':'-webkit-transform',
                'MozTransform':'-moz-transform',
                'MSTransform':'-ms-transform',
                'Transform':'transform'
            };
    document.body.insertBefore(el, null);

    for (var t in transforms) {

        if (el.style[t] !== undefined) {
            el.style[t] = "translate3d(1px,1px,1px)";
            has3d = window.getComputedStyle(el).getPropertyValue(transforms[t]);
        }
    }

    document.body.removeChild(el);
//    return (has3d !== undefined && has3d.length > 0 && has3d !== "none");
    return true;
}

/**
 *  insertAt
 *  Utility function that inserts objects at a specific index
 *  Used to maintain the order of images as they are loaded and
 *  added to the DOM
 */
Plugin.prototype.insertAt = function (index, element) {
    var lastIndex = $(this.element).children().size();
    if (index < 0) {
        index = Math.max(0, lastIndex + 1 + index);
    }
    var imgWrapper = $(this.element).append(element);
    if (index < lastIndex) {
        $(this.element).children().eq(index).before($(this.element).children().last());
    }
}

$.fn[pluginName] = function ( options ) {
    return this.each(function () {
        if (!$.data(this, 'plugin_' + pluginName)) {
            $.data(this, 'plugin_' + pluginName,
                    new Plugin( this, options ));
        }
    });
}

$(document).ready(function(){
    <!-- Add the Logo Image -->
    var $logo = $('<a class="adLogo" href="' + jsonData.logoAction + '" style="float: left; width: 180px; height: 90px" target="blank">' +
            '<div style="background: ' + jsonData.logoBackground + '; display: table-cell; text-align: center; vertical-align: middle; width: 180px; height: 90px;">' +
            '<img src="' + jsonData.logoImg+ '" style="max-width: 150px; background: transparent;">' +
            '</div>' +
            '</a>');

    <!-- Add the headline -->
    var $headline = $('<div style="display: inline-block; text-shadow: rgba(0,0,0,0.8) 1px 1px 3px,black 1px 1px 1px,rgba(52,52,52,0.5) 0px 0px 3px; color: white; margin: 5px">' + jsonData.headline + '</div>');

    <!-- Add the star ratings -->
    var stars = '';
    $.each(jsonData.rate, function(i, rateData){
        var rate = parseInt(rateData);
        var rateSub = parseInt(rateData *100) % 100;

        if(rate > 5)
            return;
        else{
            switch (rate){
                case 0:
                    stars = stars + '<div class="stars" style="height: 15px; margin: 5px; display: inline-block">' +
                            '<div style="background: url(' + starImage + ') no-repeat 0 -15px; height: 15px; width: 15px; float: left">' +
                            '<span style="width: ' + rateSub + '%; background: url(' + starImage + '); height: 100%; display: block;"></span>' +
                            '</div>' +
                            '<div style="background: url(' + starImage + ') no-repeat 0 -15px; height: 15px; width: 15px; float: left"></div>' +
                            '<div style="background: url(' + starImage + ') no-repeat 0 -15px; height: 15px; width: 15px; float: left"></div>' +
                            '<div style="background: url(' + starImage + ') no-repeat 0 -15px; height: 15px; width: 15px; float: left"></div>' +
                            '<div style="background: url(' + starImage + ') no-repeat 0 -15px; height: 15px; width: 15px; float: left"></div>' +
                            '</div>';
                    break;
                case 1:
                    stars = stars + '<div class="stars" style="height: 15px; margin: 5px; display: inline-block">' +
                            '<div style="background: url(' + starImage + '); height: 15px; width: 15px; float: left"></div>' +
                            '<div style="background: url(' + starImage + ') no-repeat 0 -15px; height: 15px; width: 15px; float: left">' +
                            '<span style="width: ' + rateSub + '%; background: url(' + starImage + '); height: 100%; display: block;"></span>' +
                            '</div>' +
                            '<div style="background: url(' + starImage + ') no-repeat 0 -15px; height: 15px; width: 15px; float: left"></div>' +
                            '<div style="background: url(' + starImage + ') no-repeat 0 -15px; height: 15px; width: 15px; float: left"></div>' +
                            '<div style="background: url(' + starImage + ') no-repeat 0 -15px; height: 15px; width: 15px; float: left"></div>' +
                            '</div>';
                    break;
                case 2:
                    stars = stars + '<div class="stars" style="height: 15px; margin: 5px; display: inline-block">' +
                            '<div style="background: url(' + starImage + '); height: 15px; width: 15px; float: left"></div>' +
                            '<div style="background: url(' + starImage + '); height: 15px; width: 15px; float: left"></div>' +
                            '<div style="background: url(' + starImage + ') no-repeat 0 -15px; height: 15px; width: 15px; float: left">' +
                            '<span style="width: ' + rateSub + '%; background: url(' + starImage + '); height: 100%; display: block;"></span>' +
                            '</div>' +
                            '<div style="background: url(' + starImage + ') no-repeat 0 -15px; height: 15px; width: 15px; float: left"></div>' +
                            '<div style="background: url(' + starImage + ') no-repeat 0 -15px; height: 15px; width: 15px; float: left"></div>' +
                            '</div>';
                    break;
                case 3:
                    stars = stars + '<div class="stars" style="height: 15px; margin: 5px; display: inline-block">' +
                            '<div style="background: url(' + starImage + '); height: 15px; width: 15px; float: left"></div>' +
                            '<div style="background: url(' + starImage + '); height: 15px; width: 15px; float: left"></div>' +
                            '<div style="background: url(' + starImage + '); height: 15px; width: 15px; float: left"></div>' +
                            '<div style="background: url(' + starImage + ') no-repeat 0 -15px; height: 15px; width: 15px; float: left">' +
                            '<span style="width: ' + rateSub + '%; background: url(' + starImage + '); height: 100%; display: block;"></span>' +
                            '</div>' +
                            '<div style="background: url(' + starImage + ') no-repeat 0 -15px; height: 15px; width: 15px; float: left"></div>' +
                            '</div>';
                    break;
                case 4:
                    stars = stars + '<div class="stars" style="height: 15px; margin: 5px; display: inline-block;">' +
                            '<div style="background: url(' + starImage + '); height: 15px; width: 15px; float: left"></div>' +
                            '<div style="background: url(' + starImage + '); height: 15px; width: 15px; float: left"></div>' +
                            '<div style="background: url(' + starImage + '); height: 15px; width: 15px; float: left"></div>' +
                            '<div style="background: url(' + starImage + '); height: 15px; width: 15px; float: left"></div>' +
                            '<div style="background: url(' + starImage + ') no-repeat 0 -15px; height: 15px; width: 15px; float: left">' +
                            '<span style="width: ' + rateSub + '%; background: url(' + starImage + '); height: 100%; display: block;"></span>' +
                            '</div>' +
                            '</div>';
                    break;
                case 5:
                    stars = stars + '<div class="stars" style="height: 15px; margin: 5px;">' +
                            '<div style="background: url(' + starImage + '); height: 15px; width: 15px; float: left"></div>' +
                            '<div style="background: url(' + starImage + '); height: 15px; width: 15px; float: left"></div>' +
                            '<div style="background: url(' + starImage + '); height: 15px; width: 15px; float: left"></div>' +
                            '<div style="background: url(' + starImage + '); height: 15px; width: 15px; float: left"></div>' +
                            '<div style="background: url(' + starImage + '); height: 15px; width: 15px; float: left"></div>' +
                            '</div>';
                    break;
            }
        }
    });

    $('.fixedContent').append($logo);
    $('.fixedContent').append($headline);
    $('.fixedContent').append(stars);

    var images = [];
    var animation = [];
    $.each(jsonData.template, function(k, src){
        images.push(src.img);
        animation.push(src.animation);
    });

    <!-- add the action -->
    var $action = $('<p class="action" style="position: absolute; z-index: 10000; text-align: center; bottom: 10px; right: 10px; margin: 0;">' +
            '<a style="display: inline-block; clear: both; -webkit-border-radius: 6px; -moz-border-radius: 6px; -ms-border-radius: 6px; -o-border-radius: 6px; border-radius: 6px; text-shadow: rgba(0,0,0,0.3) 1px 1px 1px; font-weight: normal; color: white; min-height: 20px; text-align: left; border: 2px solid #ed9300; padding: 3px 10px 3px 20px; background-image: url(' + whiteArrow + '); background-position: 0px 1px; background-repeat: no-repeat; background-color: #ed9300; text-transform: capitalize; text-decoration: none; :hover{background: red;}" href="' + jsonData.actionLink + '" target="blank">' +
            jsonData.actionName + '</a>' +
            '</p>');
    $('#wrapper').append($action);

    $('#wrapper').Kenburns({
        images: images,
        animation: animation,
        scale: jsonData.startScale,
        fadeSpeed:1200,
        ease3d:'cubic-bezier(0.445, 0.050, 0.550, 0.950)'
    });

    $(".action > a").on({
        mouseenter: function () {
            $(this).css('background-image', 'url(' + yellowArrow + ')')
                    .css('background-color', 'white')
                    .css('color', 'black');
        },
        mouseleave: function () {
            $(this).css('background-image', 'url(' + whiteArrow + ')')
                    .css('background-color', '#ed9300')
                    .css('color', 'white');
        }
    });
});
</script>
<style>
    .kb-slide{
        position: absolute;
        z-index: 1;
        opacity: 0;
        width: 548px;
        height: 90px;
        margin-left: 180px;
    }
</style>
<div id="wrapper" style="width: 726px; height: 88px; margin: 0 auto; position: relative; border: 1px solid; overflow: hidden">
    <div class="fixedContent" style="position: absolute; top: 0px; z-index: 999; width: 400px;"></div>
</div>
<!-- <div id="score" style="width: 5%; margin: 0 auto;"></div> -->
</body>
</html>
	

         