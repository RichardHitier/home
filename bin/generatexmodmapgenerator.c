// 
// 
// 9
// 
// 
// When xmodmap runs, it calls XChangeKeyboardMapping once for each key it modifies, which generates MappingNotify events. In some configurations (mine included), this burst of events causes the system to hang for some time.
// 
// I had this problem while creating a customized keyboard map, and my (ugly) workaround was writing a program that generates the C source code that will apply all modifications by calling XChangeKeyboardMapping only once, thereby triggering MappingNotify only once.
// 
// Before running this code, you must apply your map, since it will get the current keyboard mapping.

#include <stdlib.h>
#include <stdio.h>
#include <X11/XKBlib.h>

int main(void) {
    Display* display;
    int min, max, i, j, k;
    int keysyms_per_keycode;
    KeySym* keysyms;

    display = XOpenDisplay(NULL);
    XDisplayKeycodes(display, &min, &max);
    keysyms = XGetKeyboardMapping(display, min, max-min, &keysyms_per_keycode);
    printf("#include <stdlib.h>\n");
    printf("#include <stdio.h>\n");
    printf("#include <X11/XKBlib.h>\n\n");
    printf("int main(void) {\n");
    printf("    int first_keycode = %d;\n", min);
    printf("    int keysyms_per_keycode = %d;\n", keysyms_per_keycode);
    printf("    int num_of_keycodes = %d;\n", max-min);
    printf("    KeySym keysyms[%d] = {", ((max-min) * keysyms_per_keycode) + 1);
    for (k = 0, i = 0; i < (max-min); i++) {
        for (j = 0; j < keysyms_per_keycode; j++) {
            printf("%ld,", keysyms[k++]);
        }
    }
    printf("0};\n");
    printf("    Display* display = XOpenDisplay(NULL);\n");
    printf("    XChangeKeyboardMapping(display,first_keycode,keysyms_per_keycode,keysyms,num_of_keycodes);\n");
    printf("    XCloseDisplay(display);\n");
    printf("    return 0;\n");
    printf("}\n");

    XFree(keysyms);
    XCloseDisplay(display);

    return 0;
}

