package ru.ifmo.s243875.tasks.plugin.psi;

import com.intellij.extapi.psi.PsiFileBase;
import com.intellij.openapi.fileTypes.FileType;
import com.intellij.psi.FileViewProvider;
import ru.ifmo.s243875.tasks.plugin.*;
import org.jetbrains.annotations.NotNull;

public class HostsFile extends PsiFileBase {
    public HostsFile(@NotNull FileViewProvider viewProvider) {
        super(viewProvider, HostsLanguage.INSTANCE);
    }

    @NotNull
    @Override
    public FileType getFileType() {
        return HostsFileType.INSTANCE;
    }

    @Override
    public String toString() {
        return "Linux hosts file";
    }
}
