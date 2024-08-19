#include "copyingmodule.h"

CopyingModule::CopyingModule(QObject* parent) : QObject{parent}
{
    allocateMemory();
    connectSignalsWithSlots();
    setThreadForCopying();
}

void CopyingModule::allocateMemory()
{
    copyingService = new CopyingService();
    threadForCopying = new QThread(this);
}

void CopyingModule::connectSignalsWithSlots()
{
    QObject::connect(this, SIGNAL(destroyed()), threadForCopying, SLOT(quit()));
    QObject::connect(this, SIGNAL(startCopyingSignal(QString, QString)), copyingService, SLOT(startCopying(const QString&, const QString&)));
    QObject::connect(copyingService, SIGNAL(copyingFailedSignal(QString)), this, SLOT(copyingFailed(const QString&)));
    QObject::connect(copyingService, SIGNAL(copyingCompletedSignal()), this, SLOT(copyingCompleted()));
}

void CopyingModule::setThreadForCopying()
{
    copyingService->moveToThread(threadForCopying);
    threadForCopying->start();
}

CopyingModule::~CopyingModule()
{
    emit threadForCopying->quit();
    threadForCopying->wait();
    delete threadForCopying;
    delete copyingService;
}

void CopyingModule::copy(const QString& copyingObjectPath, const QString& destinationDirectoryPath)
{
    try
    {
	QFileInfo copyingObjectInfo = QFileInfo(copyingObjectPath);
	QDir destinationDirectory = QDir(destinationDirectoryPath);
	foreach (QFileInfo entry, destinationDirectory.entryInfoList(QDir::Files | QDir::Dirs | QDir::NoDotAndDotDot, QDir::Name))
	{
	    if (entry.fileName() == copyingObjectInfo.fileName())
	    {
		throw ExceptionService("A file or a directory with this name exists!");
	    }
	}
	emit startCopyingSignal(copyingObjectPath, destinationDirectoryPath);
    }
    catch (ExceptionService exceptionService)
    {
	emit copyingFailedSignal(exceptionService.getInfo());
    }
}

void CopyingModule::copyingCompleted()
{
    emit copyingCompletedSignal();
}

void CopyingModule::copyingFailed(const QString& exceptionInfo)
{
    emit copyingFailedSignal(exceptionInfo);
}
