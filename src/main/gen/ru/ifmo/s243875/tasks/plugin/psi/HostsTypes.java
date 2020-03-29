// This is a generated file. Not intended for manual editing.
package ru.ifmo.s243875.tasks.plugin.psi;

import com.intellij.psi.tree.IElementType;
import com.intellij.psi.PsiElement;
import com.intellij.lang.ASTNode;
import ru.ifmo.s243875.tasks.plugin.psi.impl.*;

public interface HostsTypes {

  IElementType PROPERTY = new HostsElementType("PROPERTY");

  IElementType COMMENT = new HostsTokenType("COMMENT");
  IElementType CRLF = new HostsTokenType("CRLF");
  IElementType IP = new HostsTokenType("IP");
  IElementType VALUE = new HostsTokenType("VALUE");

  class Factory {
    public static PsiElement createElement(ASTNode node) {
      IElementType type = node.getElementType();
      if (type == PROPERTY) {
        return new HostsPropertyImpl(node);
      }
      throw new AssertionError("Unknown element type: " + type);
    }
  }
}
