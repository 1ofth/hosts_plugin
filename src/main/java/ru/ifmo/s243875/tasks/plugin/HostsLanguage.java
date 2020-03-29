package ru.ifmo.s243875.tasks.plugin;

import com.intellij.lang.Language;

public class HostsLanguage extends Language {
    public static final HostsLanguage INSTANCE = new HostsLanguage();

    private HostsLanguage() {
        super("Hosts");
    }
}
