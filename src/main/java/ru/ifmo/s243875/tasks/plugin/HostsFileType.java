package ru.ifmo.s243875.tasks.plugin;

import com.intellij.openapi.fileTypes.LanguageFileType;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.Icon;

public class HostsFileType extends LanguageFileType {
    public static final HostsFileType INSTANCE = new HostsFileType();

    private HostsFileType() {
        super(HostsLanguage.INSTANCE);
    }

    @NotNull
    @Override
    public String getName() {
        return "Linux hosts file";
    }

    @NotNull
    @Override
    public String getDescription() {
        return "/etc/hosts file";
    }

    @NotNull
    @Override
    public String getDefaultExtension() {
        return "hosts";
    }

    @Nullable
    @Override
    public Icon getIcon() {
        return HostsIcons.FILE;
    }
}
