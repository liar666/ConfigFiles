if [[ $# != 1 ]]
then
    echo "USAGE: $0 <java file with imports to clear>"
else
    eclipse \
	-vm `which java` \
	-application org.eclipse.jdt.core.dom.rewrite.ImportRewrite \
	-verbose \
	-config /home/guillaume/workspace/.metadata/.plugins/org.eclipse.core.runtime/.settings/org.eclipse.jdt.core.prefs \
	$*
fi

 org.codehaus.groovy.eclipse.dsl.staticCheck
 org.eclipse.equinox.app.error
 org.eclipse.equinox.p2.director
 org.eclipse.equinox.p2.garbagecollector.application
 org.eclipse.equinox.p2.reconciler.application
 org.eclipse.equinox.p2.repository.repo2runnable
 org.eclipse.equinox.p2.repository.metadataverifier
 org.eclipse.equinox.p2.artifact.repository.mirrorApplication
 org.eclipse.equinox.p2.metadata.repository.mirrorApplication
 org.eclipse.equinox.p2.updatesite.UpdateSitePublisher
 org.eclipse.equinox.p2.publisher.UpdateSitePublisher
 org.eclipse.equinox.p2.publisher.CategoryPublisher
 org.eclipse.jdt.apt.core.aptBuild
 org.eclipse.jdt.core.JavaCodeFormatter
 org.eclipse.jdt.core.JavaIndexer
 org.eclipse.pde.junit.runtime.uitestapplication
 org.eclipse.pde.junit.runtime.legacytestapplication
 org.eclipse.pde.junit.runtime.coretestapplication
 org.eclipse.pde.junit.runtime.coretestapplicationnonmain
 org.eclipse.pde.junit.runtime.nonuithreadtestapplication
 org.eclipse.ui.ide.workbench
 org.eclipse.emf.codegen.CodeGen
 org.eclipse.emf.codegen.JMerger
 org.eclipse.emf.codegen.ecore.Generator
 org.eclipse.emf.mwe.core.WorkflowRunner
 org.eclipse.ant.core.antRunner
 org.eclipse.ant.ui.antRunner
 org.eclipse.e4.ui.workbench.swt.E4Application
 org.eclipse.e4.ui.workbench.swt.GenTopic
 org.eclipse.equinox.p2.publisher.InstallPublisher
 org.eclipse.equinox.p2.publisher.EclipseGenerator
 org.eclipse.equinox.p2.publisher.ProductPublisher
 org.eclipse.equinox.p2.publisher.FeaturesAndBundlesPublisher
 org.eclipse.help.base.infocenterApplication
 org.eclipse.help.base.helpApplication
 org.eclipse.help.base.indexTool
 org.eclipse.pde.build.Build
