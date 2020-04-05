package ru.ifmo.s243875.tasks.plugin;

import com.intellij.openapi.editor.colors.TextAttributesKey;
import com.intellij.openapi.fileTypes.SyntaxHighlighter;
import com.intellij.openapi.options.colors.*;
import org.jetbrains.annotations.*;

import javax.swing.*;
import java.util.Map;

public class HostsColorSettingsPage implements ColorSettingsPage {
    private static final AttributesDescriptor[] DESCRIPTORS = new AttributesDescriptor[]{
            new AttributesDescriptor("IP", HostsSyntaxHighlighter.IP),
            new AttributesDescriptor("Domain", HostsSyntaxHighlighter.VALUE),
            new AttributesDescriptor("Bad Value", HostsSyntaxHighlighter.BAD_CHARACTER)
    };

    @Nullable
    @Override
    public Icon getIcon() {
        return HostsIcons.FILE;
    }

    @NotNull
    @Override
    public SyntaxHighlighter getHighlighter() {
        return new HostsSyntaxHighlighter();
    }

    @NotNull
    @Override
    public String getDemoText() {
        return "# You are reading the \"/etc/hosts\" entry.\n" +
                "127.0.0.1\tlocalhost\n" +
                "127.0.1.1\tmy-laptop\n" +
                "\n" +
                "# The following lines are desirable for IPv6 capable hosts\n" +
                "::1\tmy-laptop\n" +
                "::127.0.0.1  ip6-localhost ip6-loopback\n" +
                "fe00::0 ip6-localnet\n" +
                "ff00::0 ip6-mcastprefix\n" +
                "ff02::1 ip6-allnodes\n" +
                "ff02::2 ip6-allrouters\n";
    }

    @Nullable
    @Override
    public Map<String, TextAttributesKey> getAdditionalHighlightingTagToDescriptorMap() {
        return null;
    }

    @NotNull
    @Override
    public AttributesDescriptor[] getAttributeDescriptors() {
        return DESCRIPTORS;
    }

    @NotNull
    @Override
    public ColorDescriptor[] getColorDescriptors() {
        return ColorDescriptor.EMPTY_ARRAY;
    }

    @NotNull
    @Override
    public String getDisplayName() {
        return "Hosts file";
    }
}