package ru.ifmo.s243875.tasks.plugin.psi;

import com.intellij.psi.tree.IElementType;
import ru.ifmo.s243875.tasks.plugin.HostsLanguage;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

public class HostsTokenType extends IElementType {
    public HostsTokenType(@NotNull @NonNls String debugName) {
        super(debugName, HostsLanguage.INSTANCE);
    }

    @Override
    public String toString() {
        return "HostsTokenType." + super.toString();
    }
}
