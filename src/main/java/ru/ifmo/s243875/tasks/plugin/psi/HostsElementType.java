package ru.ifmo.s243875.tasks.plugin.psi;

import com.intellij.psi.tree.IElementType;
import ru.ifmo.s243875.tasks.plugin.HostsLanguage;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

public class HostsElementType extends IElementType {
    public HostsElementType(@NotNull @NonNls String debugName) {
        super(debugName, HostsLanguage.INSTANCE);
    }
}
