// This is a generated file. Not intended for manual editing.
package ru.ifmo.s243875.tasks.plugin.psi.impl;

import java.util.List;
import org.jetbrains.annotations.*;
import com.intellij.lang.ASTNode;
import com.intellij.psi.PsiElement;
import com.intellij.psi.PsiElementVisitor;
import com.intellij.psi.util.PsiTreeUtil;
import static ru.ifmo.s243875.tasks.plugin.psi.HostsTypes.*;
import com.intellij.extapi.psi.ASTWrapperPsiElement;
import ru.ifmo.s243875.tasks.plugin.psi.*;

public class HostsPropertyImpl extends ASTWrapperPsiElement implements HostsProperty {

  public HostsPropertyImpl(@NotNull ASTNode node) {
    super(node);
  }

  public void accept(@NotNull HostsVisitor visitor) {
    visitor.visitProperty(this);
  }

  public void accept(@NotNull PsiElementVisitor visitor) {
    if (visitor instanceof HostsVisitor) accept((HostsVisitor)visitor);
    else super.accept(visitor);
  }

}
