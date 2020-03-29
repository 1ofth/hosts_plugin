package ru.ifmo.s243875.tasks.plugin;

import com.intellij.lexer.FlexAdapter;

import java.io.Reader;

public class HostsLexerAdapter extends FlexAdapter {
    public HostsLexerAdapter() {
        super(new HostsLexer((Reader) null));
    }
}
