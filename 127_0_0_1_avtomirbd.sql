-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 11 2019 г., 17:55
-- Версия сервера: 5.7.16-log
-- Версия PHP: 7.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `avtomirbd`
--
CREATE DATABASE IF NOT EXISTS `avtomirbd` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `avtomirbd`;

-- --------------------------------------------------------

--
-- Структура таблицы `b_admin_notify`
--

CREATE TABLE `b_admin_notify` (
  `ID` int(18) NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `ENABLE_CLOSE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `PUBLIC_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NOTIFY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_admin_notify_lang`
--

CREATE TABLE `b_admin_notify_lang` (
  `ID` int(18) NOT NULL,
  `NOTIFY_ID` int(18) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_agent`
--

CREATE TABLE `b_agent` (
  `ID` int(18) NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `NAME` text COLLATE utf8_unicode_ci,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime NOT NULL,
  `DATE_CHECK` datetime DEFAULT NULL,
  `AGENT_INTERVAL` int(18) DEFAULT '86400',
  `IS_PERIOD` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `USER_ID` int(18) DEFAULT NULL,
  `RUNNING` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_agent`
--

INSERT INTO `b_agent` (`ID`, `MODULE_ID`, `SORT`, `NAME`, `ACTIVE`, `LAST_EXEC`, `NEXT_EXEC`, `DATE_CHECK`, `AGENT_INTERVAL`, `IS_PERIOD`, `USER_ID`, `RUNNING`) VALUES
(1, 'main', 100, 'CEvent::CleanUpAgent();', 'Y', '2017-08-27 20:19:20', '2017-08-28 00:00:00', NULL, 86400, 'Y', NULL, 'N'),
(2, 'main', 100, 'CUser::CleanUpHitAuthAgent();', 'Y', '2017-08-27 20:19:20', '2017-08-28 00:00:00', NULL, 86400, 'Y', NULL, 'N'),
(3, 'main', 100, 'CCaptchaAgent::DeleteOldCaptcha(3600);', 'Y', '2017-08-17 20:29:08', '2017-08-17 21:29:08', NULL, 3600, 'N', NULL, 'N'),
(4, 'main', 100, 'CUndo::CleanUpOld();', 'Y', '2017-08-27 20:19:20', '2017-08-28 00:00:00', NULL, 86400, 'Y', NULL, 'N'),
(5, 'main', 100, 'CSiteCheckerTest::CommonTest();', 'Y', '2017-08-17 20:29:09', '2017-08-18 20:29:09', NULL, 86400, 'N', NULL, 'N'),
(6, 'main', 100, '\\Bitrix\\Main\\Analytics\\CounterDataTable::submitData();', 'Y', '2017-08-17 20:57:41', '2017-08-17 20:58:41', NULL, 60, 'N', NULL, 'N'),
(7, 'search', 10, 'CSearchSuggest::CleanUpAgent();', 'Y', '2017-08-16 21:21:35', '2017-08-17 21:21:35', NULL, 86400, 'N', NULL, 'N'),
(8, 'search', 10, 'CSearchStatistic::CleanUpAgent();', 'Y', '2017-08-16 21:21:35', '2017-08-17 21:21:35', NULL, 86400, 'N', NULL, 'N'),
(9, 'seo', 100, 'Bitrix\\Seo\\Engine\\YandexDirect::updateAgent();', 'Y', '2017-08-17 20:29:10', '2017-08-17 21:29:10', NULL, 3600, 'N', NULL, 'N'),
(10, 'seo', 100, 'Bitrix\\Seo\\Adv\\LogTable::clean();', 'Y', '2017-08-16 21:21:35', '2017-08-17 21:21:35', NULL, 86400, 'N', NULL, 'N'),
(11, 'seo', 100, 'Bitrix\\Seo\\Adv\\Auto::checkQuantityAgent();', 'Y', '2017-08-17 20:29:10', '2017-08-17 21:29:10', NULL, 3600, 'N', NULL, 'N');

-- --------------------------------------------------------

--
-- Структура таблицы `b_app_password`
--

CREATE TABLE `b_app_password` (
  `ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `APPLICATION_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DIGEST_PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_LOGIN` datetime DEFAULT NULL,
  `LAST_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SYSCOMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_b24connector_buttons`
--

CREATE TABLE `b_b24connector_buttons` (
  `ID` int(11) NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `ADD_DATE` datetime NOT NULL,
  `ADD_BY` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SCRIPT` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_bitrixcloud_option`
--

CREATE TABLE `b_bitrixcloud_option` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL,
  `PARAM_KEY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM_VALUE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_bitrixcloud_option`
--

INSERT INTO `b_bitrixcloud_option` (`ID`, `NAME`, `SORT`, `PARAM_KEY`, `PARAM_VALUE`) VALUES
(1, 'backup_quota', 0, '0', '0'),
(2, 'backup_total_size', 0, '0', '0'),
(3, 'backup_last_backup_time', 0, '0', '1502900502'),
(4, 'monitoring_expire_time', 0, '0', '1503850098');

-- --------------------------------------------------------

--
-- Структура таблицы `b_cache_tag`
--

CREATE TABLE `b_cache_tag` (
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SALT` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RELATIVE_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_cache_tag`
--

INSERT INTO `b_cache_tag` (`SITE_ID`, `CACHE_SALT`, `RELATIVE_PATH`, `TAG`) VALUES
(NULL, NULL, '0:1503851653', '**'),
('s1', '/8e1', '/s1/bitrix/catalog.section.list/8e1', 'iblock_id_1'),
('s1', '/8e1', '/s1/bitrix/catalog.top', 'iblock_id_1'),
('s1', '/fc1', '/s1/bitrix/news.list/fc1', 'iblock_id_1'),
('s1', '/efa', '/s1/bitrix/menu/06f', 'bitrix:menu'),
('s1', '/842', '/s1/bitrix/menu/06f', 'bitrix:menu'),
('s1', '/db4', '/s1/bitrix/menu/06f', 'bitrix:menu'),
('s1', '/fc1', '/s1/bitrix/menu/06f', 'bitrix:menu'),
('s1', '/e25', '/s1/bitrix/menu/06f', 'bitrix:menu');

-- --------------------------------------------------------

--
-- Структура таблицы `b_captcha`
--

CREATE TABLE `b_captcha` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_checklist`
--

CREATE TABLE `b_checklist` (
  `ID` int(11) NOT NULL,
  `DATE_CREATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TESTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMPANY_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int(11) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL,
  `SUCCESS` int(11) DEFAULT NULL,
  `FAILED` int(11) DEFAULT NULL,
  `PENDING` int(11) DEFAULT NULL,
  `SKIP` int(11) DEFAULT NULL,
  `STATE` longtext COLLATE utf8_unicode_ci,
  `REPORT_COMMENT` text COLLATE utf8_unicode_ci,
  `REPORT` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `EMAIL` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHONE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SENDED_TO_BITRIX` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_checklist`
--

INSERT INTO `b_checklist` (`ID`, `DATE_CREATE`, `TESTER`, `COMPANY_NAME`, `PICTURE`, `TOTAL`, `SUCCESS`, `FAILED`, `PENDING`, `SKIP`, `STATE`, `REPORT_COMMENT`, `REPORT`, `EMAIL`, `PHONE`, `SENDED_TO_BITRIX`, `HIDDEN`) VALUES
(1, '17.08.2017 19:27:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:66:{s:6:\"QD0020\";a:2:{s:6:\"STATUS\";s:1:\"A\";s:8:\"COMMENTS\";a:1:{s:6:\"SYSTEM\";a:2:{s:7:\"PREVIEW\";s:54:\"Проверено: 2 шаблон(a,ов) сайта.\";s:6:\"DETAIL\";s:0:\"\";}}}s:6:\"QD0010\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QD0030\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QD0040\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QD0050\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QD0060\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QD0070\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QD0080\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QD0090\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QD0100\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QD0110\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QD0120\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QM0010\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QM0020\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QS0010\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QS0020\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QS0030\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QS0040\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QC0010\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QC0020\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QC0030\";a:2:{s:6:\"STATUS\";s:1:\"A\";s:8:\"COMMENTS\";a:1:{s:6:\"SYSTEM\";a:1:{s:7:\"PREVIEW\";s:96:\"У всех кастомизированных компонентов есть описания!\";}}}s:6:\"QC0040\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QC0050\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QC0060\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QC0070\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QC0080\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QC0090\";a:2:{s:6:\"STATUS\";s:1:\"A\";s:8:\"COMMENTS\";a:1:{s:6:\"SYSTEM\";a:1:{s:7:\"PREVIEW\";s:36:\"Проверено файлов: 18\n\";}}}s:6:\"QC0100\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QC0110\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QC0120\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QC0130\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QC0140\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QC0150\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QC0160\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QE0010\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QE0020\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QE0030\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QE0040\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:8:\"QSEC0010\";a:2:{s:6:\"STATUS\";s:1:\"F\";s:8:\"COMMENTS\";a:1:{s:6:\"SYSTEM\";a:1:{s:7:\"PREVIEW\";s:137:\"Модуль проактивной защиты не установлен либо в вашу редакцию он не входит.\n\";}}}s:8:\"QSEC0020\";a:2:{s:6:\"STATUS\";s:1:\"F\";s:8:\"COMMENTS\";a:1:{s:6:\"SYSTEM\";a:1:{s:7:\"PREVIEW\";s:129:\"Уровень безопасности административной группы не является повышенным\n\";}}}s:8:\"QSEC0030\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:8:\"QSEC0040\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:8:\"QSEC0050\";a:2:{s:6:\"STATUS\";s:1:\"F\";s:8:\"COMMENTS\";a:1:{s:6:\"SYSTEM\";a:2:{s:7:\"PREVIEW\";s:27:\"Найдены ошибки\";s:6:\"DETAIL\";s:80:\"1. Пароль к БД не содержит знаков препинания\n\";}}}s:8:\"QSEC0060\";a:2:{s:6:\"STATUS\";s:1:\"A\";s:8:\"COMMENTS\";a:1:{s:6:\"SYSTEM\";a:0:{}}}s:8:\"QSEC0070\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:8:\"QSEC0080\";a:2:{s:6:\"STATUS\";s:1:\"A\";s:8:\"COMMENTS\";a:1:{s:6:\"SYSTEM\";a:2:{s:7:\"PREVIEW\";s:97:\"Проверенно файлов: 45 Найдено потенциальных проблем: 0\";s:6:\"DETAIL\";s:0:\"\";}}}s:6:\"QP0010\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QP0020\";a:2:{s:6:\"STATUS\";s:1:\"F\";s:8:\"COMMENTS\";a:1:{s:6:\"SYSTEM\";a:1:{s:7:\"PREVIEW\";s:123:\"Конфигурация PHP <a href=\"/bitrix/admin/perfmon_php.php?lang=ru\" target=\"_blank\">неоптимальна</a>.\n\";}}}s:6:\"QP0030\";a:2:{s:6:\"STATUS\";s:1:\"A\";s:8:\"COMMENTS\";a:1:{s:6:\"SYSTEM\";a:1:{s:7:\"PREVIEW\";s:48:\"Автокеширование включено\n\";}}}s:6:\"QP0040\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QP0050\";a:2:{s:6:\"STATUS\";s:1:\"F\";s:8:\"COMMENTS\";a:1:{s:6:\"SYSTEM\";a:1:{s:7:\"PREVIEW\";s:231:\"Проверка не удалась. Проведите тестирование конфигурации в <a href=\"/bitrix/admin/perfmon_panel.php?lang=ru\" target=\"_blank\">панели производительности</a>.\n\";}}}s:6:\"QP0060\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QP0070\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QP0080\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QP0090\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QP0100\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QH0010\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QH0020\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QH0030\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QH0040\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QH0050\";a:2:{s:6:\"STATUS\";s:1:\"F\";s:8:\"COMMENTS\";a:1:{s:6:\"SYSTEM\";a:1:{s:7:\"PREVIEW\";s:151:\"Резервное копирование не осуществляется. В папке /bitrix/backup не найдено файлов бекапа\";}}}s:6:\"QH0060\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QJ0010\";a:2:{s:6:\"STATUS\";s:1:\"F\";s:8:\"COMMENTS\";a:1:{s:6:\"SYSTEM\";a:1:{s:7:\"PREVIEW\";s:131:\"Лицензионный ключ <a href=\"/bitrix/admin/update_system.php?lang=ru\" target=\"_blank\">не активирован</a>\";}}}s:6:\"QJ0020\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QJ0030\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QJ0040\";a:1:{s:6:\"STATUS\";s:1:\"W\";}}', NULL, 'N', NULL, NULL, 'N', 'N');

-- --------------------------------------------------------

--
-- Структура таблицы `b_clouds_file_bucket`
--

CREATE TABLE `b_clouds_file_bucket` (
  `ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SORT` int(11) DEFAULT '500',
  `READ_ONLY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `SERVICE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BUCKET` varchar(63) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOCATION` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CNAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_COUNT` int(11) DEFAULT '0',
  `FILE_SIZE` float DEFAULT '0',
  `LAST_FILE_ID` int(11) DEFAULT NULL,
  `PREFIX` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `FILE_RULES` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_clouds_file_resize`
--

CREATE TABLE `b_clouds_file_resize` (
  `ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `ERROR_CODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `FILE_ID` int(11) DEFAULT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci,
  `FROM_PATH` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_PATH` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_clouds_file_upload`
--

CREATE TABLE `b_clouds_file_upload` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_SIZE` int(11) DEFAULT NULL,
  `TMP_FILE` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BUCKET_ID` int(11) NOT NULL,
  `PART_SIZE` int(11) NOT NULL,
  `PART_NO` int(11) NOT NULL,
  `PART_FAIL_COUNTER` int(11) NOT NULL,
  `NEXT_STEP` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_component_params`
--

CREATE TABLE `b_component_params` (
  `ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `COMPONENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TEMPLATE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REAL_PATH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SEF_MODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SEF_FOLDER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `START_CHAR` int(11) NOT NULL,
  `END_CHAR` int(11) NOT NULL,
  `PARAMETERS` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_component_params`
--

INSERT INTO `b_component_params` (`ID`, `SITE_ID`, `COMPONENT_NAME`, `TEMPLATE_NAME`, `REAL_PATH`, `SEF_MODE`, `SEF_FOLDER`, `START_CHAR`, `END_CHAR`, `PARAMETERS`) VALUES
(16, 's1', 'bitrix:search.page', '.default', '/bitrix/templates/avtomir/components/bitrix/catalog.search/search/template.php', 'N', NULL, 467, 1255, 'a:18:{s:7:\"RESTART\";s:23:\"={$arParams[\"RESTART\"]}\";s:13:\"NO_WORD_LOGIC\";s:29:\"={$arParams[\"NO_WORD_LOGIC\"]}\";s:18:\"USE_LANGUAGE_GUESS\";s:34:\"={$arParams[\"USE_LANGUAGE_GUESS\"]}\";s:11:\"CHECK_DATES\";s:27:\"={$arParams[\"CHECK_DATES\"]}\";s:9:\"arrFILTER\";a:1:{i:0;s:37:\"={\"iblock_\".$arParams[\"IBLOCK_TYPE\"]}\";}s:47:\"={\"arrFILTER_iblock_\".$arParams[\"IBLOCK_TYPE\"]}\";a:1:{i:0;s:25:\"={$arParams[\"IBLOCK_ID\"]}\";}s:14:\"USE_TITLE_RANK\";s:1:\"N\";s:12:\"DEFAULT_SORT\";s:4:\"rank\";s:11:\"FILTER_NAME\";s:0:\"\";s:10:\"SHOW_WHERE\";s:1:\"N\";s:8:\"arrWHERE\";N;s:9:\"SHOW_WHEN\";s:1:\"N\";s:17:\"PAGE_RESULT_COUNT\";s:2:\"50\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"N\";s:11:\"PAGER_TITLE\";s:0:\"\";s:17:\"PAGER_SHOW_ALWAYS\";s:1:\"N\";s:14:\"PAGER_TEMPLATE\";s:1:\"N\";}'),
(17, 's1', 'bitrix:catalog.section', '.default', '/bitrix/templates/avtomir/components/bitrix/catalog.search/search/template.php', 'N', NULL, 1384, 4489, 'a:59:{s:11:\"IBLOCK_TYPE\";s:27:\"={$arParams[\"IBLOCK_TYPE\"]}\";s:9:\"IBLOCK_ID\";s:25:\"={$arParams[\"IBLOCK_ID\"]}\";s:18:\"ELEMENT_SORT_FIELD\";s:34:\"={$arParams[\"ELEMENT_SORT_FIELD\"]}\";s:18:\"ELEMENT_SORT_ORDER\";s:34:\"={$arParams[\"ELEMENT_SORT_ORDER\"]}\";s:19:\"ELEMENT_SORT_FIELD2\";s:35:\"={$arParams[\"ELEMENT_SORT_FIELD2\"]}\";s:19:\"ELEMENT_SORT_ORDER2\";s:35:\"={$arParams[\"ELEMENT_SORT_ORDER2\"]}\";s:18:\"PAGE_ELEMENT_COUNT\";s:34:\"={$arParams[\"PAGE_ELEMENT_COUNT\"]}\";s:18:\"LINE_ELEMENT_COUNT\";s:34:\"={$arParams[\"LINE_ELEMENT_COUNT\"]}\";s:13:\"PROPERTY_CODE\";s:29:\"={$arParams[\"PROPERTY_CODE\"]}\";s:22:\"OFFERS_CART_PROPERTIES\";s:38:\"={$arParams[\"OFFERS_CART_PROPERTIES\"]}\";s:17:\"OFFERS_FIELD_CODE\";s:33:\"={$arParams[\"OFFERS_FIELD_CODE\"]}\";s:20:\"OFFERS_PROPERTY_CODE\";s:36:\"={$arParams[\"OFFERS_PROPERTY_CODE\"]}\";s:17:\"OFFERS_SORT_FIELD\";s:33:\"={$arParams[\"OFFERS_SORT_FIELD\"]}\";s:17:\"OFFERS_SORT_ORDER\";s:33:\"={$arParams[\"OFFERS_SORT_ORDER\"]}\";s:18:\"OFFERS_SORT_FIELD2\";s:34:\"={$arParams[\"OFFERS_SORT_FIELD2\"]}\";s:18:\"OFFERS_SORT_ORDER2\";s:34:\"={$arParams[\"OFFERS_SORT_ORDER2\"]}\";s:12:\"OFFERS_LIMIT\";s:28:\"={$arParams[\"OFFERS_LIMIT\"]}\";s:11:\"SECTION_URL\";s:27:\"={$arParams[\"SECTION_URL\"]}\";s:10:\"DETAIL_URL\";s:26:\"={$arParams[\"DETAIL_URL\"]}\";s:10:\"BASKET_URL\";s:26:\"={$arParams[\"BASKET_URL\"]}\";s:15:\"ACTION_VARIABLE\";s:31:\"={$arParams[\"ACTION_VARIABLE\"]}\";s:19:\"PRODUCT_ID_VARIABLE\";s:35:\"={$arParams[\"PRODUCT_ID_VARIABLE\"]}\";s:25:\"PRODUCT_QUANTITY_VARIABLE\";s:41:\"={$arParams[\"PRODUCT_QUANTITY_VARIABLE\"]}\";s:22:\"PRODUCT_PROPS_VARIABLE\";s:38:\"={$arParams[\"PRODUCT_PROPS_VARIABLE\"]}\";s:19:\"SECTION_ID_VARIABLE\";s:35:\"={$arParams[\"SECTION_ID_VARIABLE\"]}\";s:10:\"CACHE_TYPE\";s:26:\"={$arParams[\"CACHE_TYPE\"]}\";s:10:\"CACHE_TIME\";s:26:\"={$arParams[\"CACHE_TIME\"]}\";s:15:\"DISPLAY_COMPARE\";s:31:\"={$arParams[\"DISPLAY_COMPARE\"]}\";s:10:\"PRICE_CODE\";s:26:\"={$arParams[\"PRICE_CODE\"]}\";s:15:\"USE_PRICE_COUNT\";s:31:\"={$arParams[\"USE_PRICE_COUNT\"]}\";s:16:\"SHOW_PRICE_COUNT\";s:32:\"={$arParams[\"SHOW_PRICE_COUNT\"]}\";s:17:\"PRICE_VAT_INCLUDE\";s:33:\"={$arParams[\"PRICE_VAT_INCLUDE\"]}\";s:18:\"PRODUCT_PROPERTIES\";s:34:\"={$arParams[\"PRODUCT_PROPERTIES\"]}\";s:20:\"USE_PRODUCT_QUANTITY\";s:36:\"={$arParams[\"USE_PRODUCT_QUANTITY\"]}\";s:16:\"CONVERT_CURRENCY\";s:32:\"={$arParams[\"CONVERT_CURRENCY\"]}\";s:11:\"CURRENCY_ID\";s:27:\"={$arParams[\"CURRENCY_ID\"]}\";s:18:\"HIDE_NOT_AVAILABLE\";s:34:\"={$arParams[\"HIDE_NOT_AVAILABLE\"]}\";s:17:\"DISPLAY_TOP_PAGER\";s:33:\"={$arParams[\"DISPLAY_TOP_PAGER\"]}\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:36:\"={$arParams[\"DISPLAY_BOTTOM_PAGER\"]}\";s:11:\"PAGER_TITLE\";s:27:\"={$arParams[\"PAGER_TITLE\"]}\";s:17:\"PAGER_SHOW_ALWAYS\";s:33:\"={$arParams[\"PAGER_SHOW_ALWAYS\"]}\";s:14:\"PAGER_TEMPLATE\";s:30:\"={$arParams[\"PAGER_TEMPLATE\"]}\";s:20:\"PAGER_DESC_NUMBERING\";s:36:\"={$arParams[\"PAGER_DESC_NUMBERING\"]}\";s:31:\"PAGER_DESC_NUMBERING_CACHE_TIME\";s:47:\"={$arParams[\"PAGER_DESC_NUMBERING_CACHE_TIME\"]}\";s:14:\"PAGER_SHOW_ALL\";s:30:\"={$arParams[\"PAGER_SHOW_ALL\"]}\";s:11:\"FILTER_NAME\";s:12:\"searchFilter\";s:10:\"SECTION_ID\";s:0:\"\";s:12:\"SECTION_CODE\";s:0:\"\";s:19:\"SECTION_USER_FIELDS\";N;s:19:\"INCLUDE_SUBSECTIONS\";s:1:\"Y\";s:19:\"SHOW_ALL_WO_SECTION\";s:1:\"Y\";s:13:\"META_KEYWORDS\";s:0:\"\";s:16:\"META_DESCRIPTION\";s:0:\"\";s:13:\"BROWSER_TITLE\";s:0:\"\";s:18:\"ADD_SECTIONS_CHAIN\";s:1:\"N\";s:9:\"SET_TITLE\";s:1:\"N\";s:14:\"SET_STATUS_404\";s:1:\"N\";s:12:\"CACHE_FILTER\";s:1:\"N\";s:12:\"CACHE_GROUPS\";s:1:\"N\";}'),
(20, 's1', 'bitrix:catalog.element', '.default', '/katalog/tovar.php', 'N', NULL, 387, 3254, 'a:82:{s:18:\"COMPONENT_TEMPLATE\";s:8:\".default\";s:11:\"IBLOCK_TYPE\";s:7:\"catalog\";s:9:\"IBLOCK_ID\";s:1:\"1\";s:10:\"ELEMENT_ID\";s:26:\"={$_REQUEST[\"ELEMENT_ID\"]}\";s:12:\"ELEMENT_CODE\";s:0:\"\";s:10:\"SECTION_ID\";s:28:\"={$_REQUEST[\"SECTION_CODE\"]}\";s:12:\"SECTION_CODE\";s:0:\"\";s:16:\"SHOW_DEACTIVATED\";s:1:\"N\";s:13:\"PROPERTY_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:12:\"OFFERS_LIMIT\";s:1:\"0\";s:16:\"BACKGROUND_IMAGE\";s:1:\"-\";s:14:\"TEMPLATE_THEME\";s:4:\"blue\";s:24:\"PRODUCT_INFO_BLOCK_ORDER\";s:9:\"sku,props\";s:23:\"PRODUCT_PAY_BLOCK_ORDER\";s:55:\"rating,price,priceRanges,quantityLimit,quantity,buttons\";s:24:\"MAIN_BLOCK_PROPERTY_CODE\";N;s:13:\"ADD_PICT_PROP\";s:1:\"-\";s:10:\"LABEL_PROP\";N;s:12:\"DISPLAY_NAME\";s:1:\"Y\";s:16:\"IMAGE_RESOLUTION\";s:5:\"16by9\";s:11:\"SHOW_SLIDER\";s:1:\"N\";s:19:\"DETAIL_PICTURE_MODE\";a:2:{i:0;s:5:\"POPUP\";i:1;s:9:\"MAGNIFIER\";}s:20:\"ADD_DETAIL_TO_SLIDER\";s:1:\"N\";s:25:\"DISPLAY_PREVIEW_TEXT_MODE\";s:1:\"E\";s:12:\"MESS_BTN_BUY\";s:12:\"Купить\";s:22:\"MESS_BTN_ADD_TO_BASKET\";s:17:\"В корзину\";s:18:\"MESS_BTN_SUBSCRIBE\";s:22:\"Подписаться\";s:18:\"MESS_NOT_AVAILABLE\";s:24:\"Нет в наличии\";s:15:\"USE_VOTE_RATING\";s:1:\"N\";s:12:\"USE_COMMENTS\";s:1:\"N\";s:9:\"BRAND_USE\";s:1:\"N\";s:23:\"MESS_PRICE_RANGES_TITLE\";s:8:\"Цены\";s:20:\"MESS_DESCRIPTION_TAB\";s:16:\"Описание\";s:19:\"MESS_PROPERTIES_TAB\";s:28:\"Характеристики\";s:17:\"MESS_COMMENTS_TAB\";s:22:\"Комментарии\";s:11:\"SECTION_URL\";s:0:\"\";s:10:\"DETAIL_URL\";s:0:\"\";s:19:\"SECTION_ID_VARIABLE\";s:10:\"SECTION_ID\";s:25:\"CHECK_SECTION_ID_VARIABLE\";s:1:\"N\";s:8:\"SEF_MODE\";s:1:\"N\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:10:\"CACHE_TIME\";s:8:\"36000000\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:9:\"SET_TITLE\";s:1:\"Y\";s:17:\"SET_CANONICAL_URL\";s:1:\"N\";s:17:\"SET_BROWSER_TITLE\";s:1:\"Y\";s:13:\"BROWSER_TITLE\";s:1:\"-\";s:17:\"SET_META_KEYWORDS\";s:1:\"Y\";s:13:\"META_KEYWORDS\";s:1:\"-\";s:20:\"SET_META_DESCRIPTION\";s:1:\"Y\";s:16:\"META_DESCRIPTION\";s:1:\"-\";s:17:\"SET_LAST_MODIFIED\";s:1:\"N\";s:24:\"USE_MAIN_ELEMENT_SECTION\";s:1:\"N\";s:20:\"STRICT_SECTION_CHECK\";s:1:\"N\";s:18:\"ADD_SECTIONS_CHAIN\";s:1:\"Y\";s:17:\"ADD_ELEMENT_CHAIN\";s:1:\"N\";s:15:\"ACTION_VARIABLE\";s:6:\"action\";s:19:\"PRODUCT_ID_VARIABLE\";s:2:\"id\";s:15:\"DISPLAY_COMPARE\";s:1:\"N\";s:10:\"PRICE_CODE\";N;s:15:\"USE_PRICE_COUNT\";s:1:\"N\";s:16:\"SHOW_PRICE_COUNT\";s:1:\"1\";s:17:\"PRICE_VAT_INCLUDE\";s:1:\"Y\";s:20:\"PRICE_VAT_SHOW_VALUE\";s:1:\"N\";s:19:\"USE_RATIO_IN_RANGES\";s:1:\"N\";s:10:\"BASKET_URL\";s:20:\"/personal/basket.php\";s:20:\"USE_PRODUCT_QUANTITY\";s:1:\"N\";s:25:\"PRODUCT_QUANTITY_VARIABLE\";s:8:\"quantity\";s:24:\"ADD_PROPERTIES_TO_BASKET\";s:1:\"Y\";s:22:\"PRODUCT_PROPS_VARIABLE\";s:4:\"prop\";s:26:\"PARTIAL_PRODUCT_PROPERTIES\";s:1:\"N\";s:18:\"PRODUCT_PROPERTIES\";N;s:16:\"LINK_IBLOCK_TYPE\";s:0:\"\";s:14:\"LINK_IBLOCK_ID\";s:0:\"\";s:17:\"LINK_PROPERTY_SID\";s:0:\"\";s:17:\"LINK_ELEMENTS_URL\";s:39:\"link.php?PARENT_ELEMENT_ID=#ELEMENT_ID#\";s:14:\"SET_STATUS_404\";s:1:\"N\";s:8:\"SHOW_404\";s:1:\"N\";s:11:\"MESSAGE_404\";s:0:\"\";s:15:\"COMPATIBLE_MODE\";s:1:\"Y\";s:19:\"USE_ELEMENT_COUNTER\";s:1:\"Y\";s:28:\"DISABLE_INIT_JS_IN_COMPONENT\";s:1:\"N\";s:22:\"USE_ENHANCED_ECOMMERCE\";s:1:\"N\";}'),
(24, 's1', 'bitrix:catalog', 'catalog', '/katalog/index.php', 'Y', '/katalog/', 553, 10590, 'a:128:{s:18:\"COMPONENT_TEMPLATE\";s:8:\".default\";s:11:\"IBLOCK_TYPE\";s:7:\"catalog\";s:9:\"IBLOCK_ID\";s:1:\"1\";s:14:\"TEMPLATE_THEME\";s:5:\"black\";s:13:\"ADD_PICT_PROP\";s:1:\"-\";s:10:\"LABEL_PROP\";s:0:\"\";s:12:\"MESS_BTN_BUY\";s:12:\"Купить\";s:22:\"MESS_BTN_ADD_TO_BASKET\";s:17:\"В корзину\";s:16:\"MESS_BTN_COMPARE\";s:0:\"\";s:15:\"MESS_BTN_DETAIL\";s:0:\"\";s:18:\"MESS_NOT_AVAILABLE\";s:24:\"Нет в наличии\";s:18:\"MESS_BTN_SUBSCRIBE\";s:0:\"\";s:20:\"SIDEBAR_SECTION_SHOW\";s:1:\"N\";s:19:\"SIDEBAR_DETAIL_SHOW\";s:1:\"N\";s:12:\"SIDEBAR_PATH\";s:0:\"\";s:8:\"SEF_MODE\";s:1:\"Y\";s:10:\"SEF_FOLDER\";s:9:\"/katalog/\";s:9:\"AJAX_MODE\";s:1:\"N\";s:16:\"AJAX_OPTION_JUMP\";s:1:\"N\";s:17:\"AJAX_OPTION_STYLE\";s:1:\"Y\";s:19:\"AJAX_OPTION_HISTORY\";s:1:\"N\";s:22:\"AJAX_OPTION_ADDITIONAL\";s:0:\"\";s:10:\"CACHE_TYPE\";s:1:\"N\";s:10:\"CACHE_TIME\";s:8:\"36000000\";s:12:\"CACHE_FILTER\";s:1:\"N\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:24:\"USE_MAIN_ELEMENT_SECTION\";s:1:\"N\";s:27:\"DETAIL_STRICT_SECTION_CHECK\";s:1:\"N\";s:17:\"SET_LAST_MODIFIED\";s:1:\"N\";s:9:\"SET_TITLE\";s:1:\"N\";s:18:\"ADD_SECTIONS_CHAIN\";s:1:\"Y\";s:17:\"ADD_ELEMENT_CHAIN\";s:1:\"Y\";s:10:\"USE_FILTER\";s:1:\"N\";s:16:\"FILTER_VIEW_MODE\";s:10:\"HORIZONTAL\";s:21:\"FILTER_HIDE_ON_MOBILE\";s:1:\"N\";s:14:\"INSTANT_RELOAD\";s:1:\"N\";s:15:\"ACTION_VARIABLE\";s:6:\"action\";s:19:\"PRODUCT_ID_VARIABLE\";s:2:\"id\";s:11:\"USE_COMPARE\";s:1:\"N\";s:10:\"PRICE_CODE\";a:1:{i:0;s:5:\"price\";}s:15:\"USE_PRICE_COUNT\";s:1:\"N\";s:16:\"SHOW_PRICE_COUNT\";s:1:\"1\";s:17:\"PRICE_VAT_INCLUDE\";s:1:\"Y\";s:20:\"PRICE_VAT_SHOW_VALUE\";s:1:\"N\";s:10:\"BASKET_URL\";s:20:\"/personal/basket.php\";s:20:\"USE_PRODUCT_QUANTITY\";s:1:\"N\";s:25:\"PRODUCT_QUANTITY_VARIABLE\";s:8:\"quantity\";s:24:\"ADD_PROPERTIES_TO_BASKET\";s:1:\"Y\";s:22:\"PRODUCT_PROPS_VARIABLE\";s:4:\"prop\";s:26:\"PARTIAL_PRODUCT_PROPERTIES\";s:1:\"N\";s:18:\"PRODUCT_PROPERTIES\";s:0:\"\";s:24:\"SEARCH_PAGE_RESULT_COUNT\";s:2:\"50\";s:14:\"SEARCH_RESTART\";s:1:\"N\";s:20:\"SEARCH_NO_WORD_LOGIC\";s:1:\"Y\";s:25:\"SEARCH_USE_LANGUAGE_GUESS\";s:1:\"Y\";s:18:\"SEARCH_CHECK_DATES\";s:1:\"Y\";s:17:\"SHOW_TOP_ELEMENTS\";s:1:\"N\";s:22:\"SECTION_COUNT_ELEMENTS\";s:1:\"Y\";s:17:\"SECTION_TOP_DEPTH\";s:1:\"2\";s:18:\"SECTIONS_VIEW_MODE\";s:4:\"TILE\";s:25:\"SECTIONS_SHOW_PARENT_NAME\";s:1:\"Y\";s:26:\"SECTIONS_HIDE_SECTION_NAME\";s:1:\"N\";s:18:\"PAGE_ELEMENT_COUNT\";s:2:\"30\";s:18:\"LINE_ELEMENT_COUNT\";s:1:\"3\";s:18:\"ELEMENT_SORT_FIELD\";s:4:\"sort\";s:18:\"ELEMENT_SORT_ORDER\";s:3:\"asc\";s:19:\"ELEMENT_SORT_FIELD2\";s:2:\"id\";s:19:\"ELEMENT_SORT_ORDER2\";s:4:\"desc\";s:18:\"LIST_PROPERTY_CODE\";a:3:{i:0;s:7:\"articul\";i:1;s:5:\"price\";i:2;s:0:\"\";}s:25:\"LIST_PROPERTY_CODE_MOBILE\";s:0:\"\";s:19:\"INCLUDE_SUBSECTIONS\";s:1:\"Y\";s:18:\"LIST_META_KEYWORDS\";s:1:\"-\";s:21:\"LIST_META_DESCRIPTION\";s:1:\"-\";s:18:\"LIST_BROWSER_TITLE\";s:1:\"-\";s:24:\"SECTION_BACKGROUND_IMAGE\";s:1:\"-\";s:25:\"LIST_PRODUCT_BLOCKS_ORDER\";s:54:\"price,props,sku,quantityLimit,quantity,buttons,compare\";s:25:\"LIST_PRODUCT_ROW_VARIANTS\";s:166:\"[{\'VARIANT\':\'3\',\'BIG_DATA\':false},{\'VARIANT\':\'3\',\'BIG_DATA\':false},{\'VARIANT\':\'3\',\'BIG_DATA\':false},{\'VARIANT\':\'3\',\'BIG_DATA\':false},{\'VARIANT\':\'3\',\'BIG_DATA\':false}]\";s:20:\"LIST_ENLARGE_PRODUCT\";s:6:\"STRICT\";s:16:\"LIST_SHOW_SLIDER\";s:1:\"Y\";s:20:\"LIST_SLIDER_INTERVAL\";s:4:\"3000\";s:20:\"LIST_SLIDER_PROGRESS\";s:1:\"N\";s:20:\"DETAIL_PROPERTY_CODE\";a:4:{i:0;s:7:\"articul\";i:1;s:5:\"count\";i:2;s:5:\"price\";i:3;s:0:\"\";}s:20:\"DETAIL_META_KEYWORDS\";s:1:\"-\";s:23:\"DETAIL_META_DESCRIPTION\";s:1:\"-\";s:20:\"DETAIL_BROWSER_TITLE\";s:1:\"-\";s:24:\"DETAIL_SET_CANONICAL_URL\";s:1:\"N\";s:19:\"SECTION_ID_VARIABLE\";s:10:\"SECTION_ID\";s:32:\"DETAIL_CHECK_SECTION_ID_VARIABLE\";s:1:\"N\";s:23:\"DETAIL_BACKGROUND_IMAGE\";s:1:\"-\";s:16:\"SHOW_DEACTIVATED\";s:1:\"N\";s:31:\"DETAIL_MAIN_BLOCK_PROPERTY_CODE\";s:0:\"\";s:22:\"DETAIL_USE_VOTE_RATING\";s:1:\"N\";s:19:\"DETAIL_USE_COMMENTS\";s:1:\"N\";s:16:\"DETAIL_BRAND_USE\";s:1:\"N\";s:19:\"DETAIL_DISPLAY_NAME\";s:1:\"Y\";s:23:\"DETAIL_IMAGE_RESOLUTION\";s:5:\"16by9\";s:31:\"DETAIL_PRODUCT_INFO_BLOCK_ORDER\";s:9:\"sku,props\";s:30:\"DETAIL_PRODUCT_PAY_BLOCK_ORDER\";s:55:\"rating,price,priceRanges,quantityLimit,quantity,buttons\";s:18:\"DETAIL_SHOW_SLIDER\";s:1:\"N\";s:26:\"DETAIL_DETAIL_PICTURE_MODE\";a:2:{i:0;s:5:\"POPUP\";i:1;s:9:\"MAGNIFIER\";}s:27:\"DETAIL_ADD_DETAIL_TO_SLIDER\";s:1:\"N\";s:32:\"DETAIL_DISPLAY_PREVIEW_TEXT_MODE\";s:1:\"E\";s:19:\"DETAIL_SHOW_POPULAR\";s:1:\"Y\";s:18:\"DETAIL_SHOW_VIEWED\";s:1:\"Y\";s:16:\"LINK_IBLOCK_TYPE\";s:7:\"catalog\";s:14:\"LINK_IBLOCK_ID\";s:1:\"1\";s:17:\"LINK_PROPERTY_SID\";s:0:\"\";s:17:\"LINK_ELEMENTS_URL\";s:39:\"link.php?PARENT_ELEMENT_ID=#ELEMENT_ID#\";s:9:\"USE_STORE\";s:1:\"Y\";s:14:\"PAGER_TEMPLATE\";s:8:\".default\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"Y\";s:11:\"PAGER_TITLE\";s:12:\"Товары\";s:17:\"PAGER_SHOW_ALWAYS\";s:1:\"N\";s:20:\"PAGER_DESC_NUMBERING\";s:1:\"N\";s:31:\"PAGER_DESC_NUMBERING_CACHE_TIME\";s:5:\"36000\";s:14:\"PAGER_SHOW_ALL\";s:1:\"N\";s:22:\"PAGER_BASE_LINK_ENABLE\";s:1:\"N\";s:9:\"LAZY_LOAD\";s:1:\"N\";s:14:\"LOAD_ON_SCROLL\";s:1:\"N\";s:14:\"SET_STATUS_404\";s:1:\"N\";s:8:\"SHOW_404\";s:1:\"N\";s:11:\"MESSAGE_404\";s:0:\"\";s:15:\"COMPATIBLE_MODE\";s:1:\"Y\";s:19:\"USE_ELEMENT_COUNTER\";s:1:\"Y\";s:28:\"DISABLE_INIT_JS_IN_COMPONENT\";s:1:\"N\";s:22:\"USE_ENHANCED_ECOMMERCE\";s:1:\"N\";s:17:\"SEF_URL_TEMPLATES\";a:5:{s:8:\"sections\";s:0:\"\";s:7:\"section\";s:15:\"#SECTION_CODE#/\";s:7:\"element\";s:28:\"#SECTION_CODE#/#ELEMENT_ID#/\";s:7:\"compare\";s:0:\"\";s:12:\"smart_filter\";s:46:\"#SECTION_ID#/filter/#SMART_FILTER_PATH#/apply/\";}}'),
(25, 's1', 'bitrix:catalog.section.list', '', '/bitrix/templates/avtomir/components/bitrix/catalog/catalog/sections.php', 'N', NULL, 525, 1397, 'a:12:{s:11:\"IBLOCK_TYPE\";s:27:\"={$arParams[\"IBLOCK_TYPE\"]}\";s:9:\"IBLOCK_ID\";s:25:\"={$arParams[\"IBLOCK_ID\"]}\";s:10:\"CACHE_TYPE\";s:26:\"={$arParams[\"CACHE_TYPE\"]}\";s:10:\"CACHE_TIME\";s:26:\"={$arParams[\"CACHE_TIME\"]}\";s:12:\"CACHE_GROUPS\";s:28:\"={$arParams[\"CACHE_GROUPS\"]}\";s:14:\"COUNT_ELEMENTS\";s:38:\"={$arParams[\"SECTION_COUNT_ELEMENTS\"]}\";s:9:\"TOP_DEPTH\";s:33:\"={$arParams[\"SECTION_TOP_DEPTH\"]}\";s:11:\"SECTION_URL\";s:60:\"={$arResult[\"FOLDER\"].$arResult[\"URL_TEMPLATES\"][\"section\"]}\";s:9:\"VIEW_MODE\";s:34:\"={$arParams[\"SECTIONS_VIEW_MODE\"]}\";s:16:\"SHOW_PARENT_NAME\";s:41:\"={$arParams[\"SECTIONS_SHOW_PARENT_NAME\"]}\";s:17:\"HIDE_SECTION_NAME\";s:95:\"={(isset($arParams[\"SECTIONS_HIDE_SECTION_NAME\"])?$arParams[\"SECTIONS_HIDE_SECTION_NAME\"]:\"N\")}\";s:18:\"ADD_SECTIONS_CHAIN\";s:78:\"={(isset($arParams[\"ADD_SECTIONS_CHAIN\"])?$arParams[\"ADD_SECTIONS_CHAIN\"]:\"\")}\";}'),
(26, 's1', 'bitrix:catalog.compare.list', '', '/bitrix/templates/avtomir/components/bitrix/catalog/catalog/sections.php', 'N', NULL, 1440, 2232, 'a:9:{s:11:\"IBLOCK_TYPE\";s:27:\"={$arParams[\"IBLOCK_TYPE\"]}\";s:9:\"IBLOCK_ID\";s:25:\"={$arParams[\"IBLOCK_ID\"]}\";s:4:\"NAME\";s:28:\"={$arParams[\"COMPARE_NAME\"]}\";s:10:\"DETAIL_URL\";s:60:\"={$arResult[\"FOLDER\"].$arResult[\"URL_TEMPLATES\"][\"element\"]}\";s:11:\"COMPARE_URL\";s:60:\"={$arResult[\"FOLDER\"].$arResult[\"URL_TEMPLATES\"][\"compare\"]}\";s:15:\"ACTION_VARIABLE\";s:86:\"={(!empty($arParams[\"ACTION_VARIABLE\"])?$arParams[\"ACTION_VARIABLE\"]:\"action\").\"_ccl\"}\";s:19:\"PRODUCT_ID_VARIABLE\";s:35:\"={$arParams[\"PRODUCT_ID_VARIABLE\"]}\";s:14:\"POSITION_FIXED\";s:84:\"={isset($arParams[\"COMPARE_POSITION_FIXED\"])?$arParams[\"COMPARE_POSITION_FIXED\"]:\"\"}\";s:8:\"POSITION\";s:72:\"={isset($arParams[\"COMPARE_POSITION\"])?$arParams[\"COMPARE_POSITION\"]:\"\"}\";}'),
(27, 's1', 'bitrix:catalog.top', '', '/bitrix/templates/avtomir/components/bitrix/catalog/catalog/sections.php', 'N', NULL, 2642, 7454, 'a:72:{s:11:\"IBLOCK_TYPE\";s:27:\"={$arParams[\"IBLOCK_TYPE\"]}\";s:9:\"IBLOCK_ID\";s:25:\"={$arParams[\"IBLOCK_ID\"]}\";s:18:\"ELEMENT_SORT_FIELD\";s:38:\"={$arParams[\"TOP_ELEMENT_SORT_FIELD\"]}\";s:18:\"ELEMENT_SORT_ORDER\";s:38:\"={$arParams[\"TOP_ELEMENT_SORT_ORDER\"]}\";s:19:\"ELEMENT_SORT_FIELD2\";s:39:\"={$arParams[\"TOP_ELEMENT_SORT_FIELD2\"]}\";s:19:\"ELEMENT_SORT_ORDER2\";s:39:\"={$arParams[\"TOP_ELEMENT_SORT_ORDER2\"]}\";s:11:\"SECTION_URL\";s:60:\"={$arResult[\"FOLDER\"].$arResult[\"URL_TEMPLATES\"][\"section\"]}\";s:10:\"DETAIL_URL\";s:60:\"={$arResult[\"FOLDER\"].$arResult[\"URL_TEMPLATES\"][\"element\"]}\";s:10:\"BASKET_URL\";s:26:\"={$arParams[\"BASKET_URL\"]}\";s:15:\"ACTION_VARIABLE\";s:31:\"={$arParams[\"ACTION_VARIABLE\"]}\";s:19:\"PRODUCT_ID_VARIABLE\";s:35:\"={$arParams[\"PRODUCT_ID_VARIABLE\"]}\";s:19:\"SECTION_ID_VARIABLE\";s:35:\"={$arParams[\"SECTION_ID_VARIABLE\"]}\";s:25:\"PRODUCT_QUANTITY_VARIABLE\";s:41:\"={$arParams[\"PRODUCT_QUANTITY_VARIABLE\"]}\";s:22:\"PRODUCT_PROPS_VARIABLE\";s:38:\"={$arParams[\"PRODUCT_PROPS_VARIABLE\"]}\";s:15:\"DISPLAY_COMPARE\";s:27:\"={$arParams[\"USE_COMPARE\"]}\";s:13:\"ELEMENT_COUNT\";s:33:\"={$arParams[\"TOP_ELEMENT_COUNT\"]}\";s:18:\"LINE_ELEMENT_COUNT\";s:38:\"={$arParams[\"TOP_LINE_ELEMENT_COUNT\"]}\";s:13:\"PROPERTY_CODE\";s:33:\"={$arParams[\"TOP_PROPERTY_CODE\"]}\";s:20:\"PROPERTY_CODE_MOBILE\";s:40:\"={$arParams[\"TOP_PROPERTY_CODE_MOBILE\"]}\";s:10:\"PRICE_CODE\";s:26:\"={$arParams[\"PRICE_CODE\"]}\";s:15:\"USE_PRICE_COUNT\";s:31:\"={$arParams[\"USE_PRICE_COUNT\"]}\";s:16:\"SHOW_PRICE_COUNT\";s:32:\"={$arParams[\"SHOW_PRICE_COUNT\"]}\";s:17:\"PRICE_VAT_INCLUDE\";s:33:\"={$arParams[\"PRICE_VAT_INCLUDE\"]}\";s:20:\"PRICE_VAT_SHOW_VALUE\";s:36:\"={$arParams[\"PRICE_VAT_SHOW_VALUE\"]}\";s:20:\"USE_PRODUCT_QUANTITY\";s:36:\"={$arParams[\"USE_PRODUCT_QUANTITY\"]}\";s:24:\"ADD_PROPERTIES_TO_BASKET\";s:90:\"={(isset($arParams[\"ADD_PROPERTIES_TO_BASKET\"])?$arParams[\"ADD_PROPERTIES_TO_BASKET\"]:\"\")}\";s:26:\"PARTIAL_PRODUCT_PROPERTIES\";s:94:\"={(isset($arParams[\"PARTIAL_PRODUCT_PROPERTIES\"])?$arParams[\"PARTIAL_PRODUCT_PROPERTIES\"]:\"\")}\";s:18:\"PRODUCT_PROPERTIES\";s:34:\"={$arParams[\"PRODUCT_PROPERTIES\"]}\";s:10:\"CACHE_TYPE\";s:26:\"={$arParams[\"CACHE_TYPE\"]}\";s:10:\"CACHE_TIME\";s:26:\"={$arParams[\"CACHE_TIME\"]}\";s:12:\"CACHE_GROUPS\";s:28:\"={$arParams[\"CACHE_GROUPS\"]}\";s:22:\"OFFERS_CART_PROPERTIES\";s:38:\"={$arParams[\"OFFERS_CART_PROPERTIES\"]}\";s:17:\"OFFERS_FIELD_CODE\";s:37:\"={$arParams[\"TOP_OFFERS_FIELD_CODE\"]}\";s:20:\"OFFERS_PROPERTY_CODE\";s:40:\"={$arParams[\"TOP_OFFERS_PROPERTY_CODE\"]}\";s:17:\"OFFERS_SORT_FIELD\";s:33:\"={$arParams[\"OFFERS_SORT_FIELD\"]}\";s:17:\"OFFERS_SORT_ORDER\";s:33:\"={$arParams[\"OFFERS_SORT_ORDER\"]}\";s:18:\"OFFERS_SORT_FIELD2\";s:34:\"={$arParams[\"OFFERS_SORT_FIELD2\"]}\";s:18:\"OFFERS_SORT_ORDER2\";s:34:\"={$arParams[\"OFFERS_SORT_ORDER2\"]}\";s:12:\"OFFERS_LIMIT\";s:32:\"={$arParams[\"TOP_OFFERS_LIMIT\"]}\";s:16:\"CONVERT_CURRENCY\";s:32:\"={$arParams[\"CONVERT_CURRENCY\"]}\";s:11:\"CURRENCY_ID\";s:27:\"={$arParams[\"CURRENCY_ID\"]}\";s:18:\"HIDE_NOT_AVAILABLE\";s:34:\"={$arParams[\"HIDE_NOT_AVAILABLE\"]}\";s:9:\"VIEW_MODE\";s:68:\"={(isset($arParams[\"TOP_VIEW_MODE\"])?$arParams[\"TOP_VIEW_MODE\"]:\"\")}\";s:12:\"ROTATE_TIMER\";s:74:\"={(isset($arParams[\"TOP_ROTATE_TIMER\"])?$arParams[\"TOP_ROTATE_TIMER\"]:\"\")}\";s:14:\"TEMPLATE_THEME\";s:70:\"={(isset($arParams[\"TEMPLATE_THEME\"])?$arParams[\"TEMPLATE_THEME\"]:\"\")}\";s:10:\"LABEL_PROP\";s:26:\"={$arParams[\"LABEL_PROP\"]}\";s:17:\"LABEL_PROP_MOBILE\";s:33:\"={$arParams[\"LABEL_PROP_MOBILE\"]}\";s:19:\"LABEL_PROP_POSITION\";s:35:\"={$arParams[\"LABEL_PROP_POSITION\"]}\";s:13:\"ADD_PICT_PROP\";s:29:\"={$arParams[\"ADD_PICT_PROP\"]}\";s:20:\"PRODUCT_DISPLAY_MODE\";s:36:\"={$arParams[\"PRODUCT_DISPLAY_MODE\"]}\";s:20:\"PRODUCT_BLOCKS_ORDER\";s:40:\"={$arParams[\"TOP_PRODUCT_BLOCKS_ORDER\"]}\";s:20:\"PRODUCT_ROW_VARIANTS\";s:40:\"={$arParams[\"TOP_PRODUCT_ROW_VARIANTS\"]}\";s:15:\"ENLARGE_PRODUCT\";s:35:\"={$arParams[\"TOP_ENLARGE_PRODUCT\"]}\";s:12:\"ENLARGE_PROP\";s:72:\"={isset($arParams[\"TOP_ENLARGE_PROP\"])?$arParams[\"TOP_ENLARGE_PROP\"]:\"\"}\";s:11:\"SHOW_SLIDER\";s:31:\"={$arParams[\"TOP_SHOW_SLIDER\"]}\";s:15:\"SLIDER_INTERVAL\";s:78:\"={isset($arParams[\"TOP_SLIDER_INTERVAL\"])?$arParams[\"TOP_SLIDER_INTERVAL\"]:\"\"}\";s:15:\"SLIDER_PROGRESS\";s:78:\"={isset($arParams[\"TOP_SLIDER_PROGRESS\"])?$arParams[\"TOP_SLIDER_PROGRESS\"]:\"\"}\";s:19:\"OFFER_ADD_PICT_PROP\";s:35:\"={$arParams[\"OFFER_ADD_PICT_PROP\"]}\";s:16:\"OFFER_TREE_PROPS\";s:32:\"={$arParams[\"OFFER_TREE_PROPS\"]}\";s:20:\"PRODUCT_SUBSCRIPTION\";s:36:\"={$arParams[\"PRODUCT_SUBSCRIPTION\"]}\";s:21:\"SHOW_DISCOUNT_PERCENT\";s:37:\"={$arParams[\"SHOW_DISCOUNT_PERCENT\"]}\";s:25:\"DISCOUNT_PERCENT_POSITION\";s:41:\"={$arParams[\"DISCOUNT_PERCENT_POSITION\"]}\";s:14:\"SHOW_OLD_PRICE\";s:30:\"={$arParams[\"SHOW_OLD_PRICE\"]}\";s:12:\"MESS_BTN_BUY\";s:29:\"={$arParams[\"~MESS_BTN_BUY\"]}\";s:22:\"MESS_BTN_ADD_TO_BASKET\";s:39:\"={$arParams[\"~MESS_BTN_ADD_TO_BASKET\"]}\";s:18:\"MESS_BTN_SUBSCRIBE\";s:35:\"={$arParams[\"~MESS_BTN_SUBSCRIBE\"]}\";s:15:\"MESS_BTN_DETAIL\";s:32:\"={$arParams[\"~MESS_BTN_DETAIL\"]}\";s:18:\"MESS_NOT_AVAILABLE\";s:35:\"={$arParams[\"~MESS_NOT_AVAILABLE\"]}\";s:20:\"ADD_TO_BASKET_ACTION\";s:16:\"={$basketAction}\";s:16:\"SHOW_CLOSE_POPUP\";s:86:\"={isset($arParams[\"COMMON_SHOW_CLOSE_POPUP\"])?$arParams[\"COMMON_SHOW_CLOSE_POPUP\"]:\"\"}\";s:12:\"COMPARE_PATH\";s:60:\"={$arResult[\"FOLDER\"].$arResult[\"URL_TEMPLATES\"][\"compare\"]}\";s:15:\"COMPATIBLE_MODE\";s:72:\"={(isset($arParams[\"COMPATIBLE_MODE\"])?$arParams[\"COMPATIBLE_MODE\"]:\"\")}\";}'),
(32, 's1', 'bitrix:news.detail', '.default', '/news/index.php', 'N', NULL, 99, 1592, 'a:47:{s:18:\"ACTIVE_DATE_FORMAT\";s:5:\"d.m.Y\";s:17:\"ADD_ELEMENT_CHAIN\";s:1:\"N\";s:18:\"ADD_SECTIONS_CHAIN\";s:1:\"N\";s:9:\"AJAX_MODE\";s:1:\"N\";s:22:\"AJAX_OPTION_ADDITIONAL\";s:0:\"\";s:19:\"AJAX_OPTION_HISTORY\";s:1:\"N\";s:16:\"AJAX_OPTION_JUMP\";s:1:\"N\";s:17:\"AJAX_OPTION_STYLE\";s:1:\"Y\";s:13:\"BROWSER_TITLE\";s:1:\"-\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:10:\"CACHE_TIME\";s:8:\"36000000\";s:10:\"CACHE_TYPE\";s:1:\"N\";s:11:\"CHECK_DATES\";s:1:\"Y\";s:10:\"DETAIL_URL\";s:0:\"\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"Y\";s:12:\"DISPLAY_DATE\";s:1:\"N\";s:12:\"DISPLAY_NAME\";s:1:\"Y\";s:15:\"DISPLAY_PICTURE\";s:1:\"Y\";s:20:\"DISPLAY_PREVIEW_TEXT\";s:1:\"Y\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:12:\"ELEMENT_CODE\";s:0:\"\";s:10:\"ELEMENT_ID\";s:26:\"={$_REQUEST[\"ELEMENT_ID\"]}\";s:10:\"FIELD_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:9:\"IBLOCK_ID\";s:1:\"2\";s:11:\"IBLOCK_TYPE\";s:4:\"news\";s:10:\"IBLOCK_URL\";s:0:\"\";s:25:\"INCLUDE_IBLOCK_INTO_CHAIN\";s:1:\"Y\";s:11:\"MESSAGE_404\";s:0:\"\";s:16:\"META_DESCRIPTION\";s:1:\"-\";s:13:\"META_KEYWORDS\";s:1:\"-\";s:22:\"PAGER_BASE_LINK_ENABLE\";s:1:\"N\";s:14:\"PAGER_SHOW_ALL\";s:1:\"N\";s:14:\"PAGER_TEMPLATE\";s:8:\".default\";s:11:\"PAGER_TITLE\";s:16:\"Страница\";s:13:\"PROPERTY_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:17:\"SET_BROWSER_TITLE\";s:1:\"N\";s:17:\"SET_CANONICAL_URL\";s:1:\"N\";s:17:\"SET_LAST_MODIFIED\";s:1:\"N\";s:20:\"SET_META_DESCRIPTION\";s:1:\"N\";s:17:\"SET_META_KEYWORDS\";s:1:\"N\";s:14:\"SET_STATUS_404\";s:1:\"N\";s:9:\"SET_TITLE\";s:1:\"N\";s:8:\"SHOW_404\";s:1:\"N\";s:20:\"STRICT_SECTION_CHECK\";s:1:\"N\";s:15:\"USE_PERMISSIONS\";s:1:\"N\";s:9:\"USE_SHARE\";s:1:\"N\";s:18:\"COMPONENT_TEMPLATE\";s:8:\".default\";}'),
(33, 's1', 'bitrix:news.list', '.default', '/news/index.php', 'N', NULL, 1601, 3259, 'a:52:{s:18:\"COMPONENT_TEMPLATE\";s:8:\".default\";s:11:\"IBLOCK_TYPE\";s:4:\"news\";s:9:\"IBLOCK_ID\";s:1:\"2\";s:10:\"NEWS_COUNT\";s:1:\"5\";s:8:\"SORT_BY1\";s:11:\"ACTIVE_FROM\";s:11:\"SORT_ORDER1\";s:4:\"DESC\";s:8:\"SORT_BY2\";s:4:\"SORT\";s:11:\"SORT_ORDER2\";s:3:\"ASC\";s:11:\"FILTER_NAME\";s:0:\"\";s:10:\"FIELD_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:13:\"PROPERTY_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:11:\"CHECK_DATES\";s:1:\"Y\";s:10:\"DETAIL_URL\";s:0:\"\";s:9:\"AJAX_MODE\";s:1:\"N\";s:16:\"AJAX_OPTION_JUMP\";s:1:\"N\";s:17:\"AJAX_OPTION_STYLE\";s:1:\"Y\";s:19:\"AJAX_OPTION_HISTORY\";s:1:\"N\";s:22:\"AJAX_OPTION_ADDITIONAL\";s:0:\"\";s:10:\"CACHE_TYPE\";s:1:\"N\";s:10:\"CACHE_TIME\";s:8:\"36000000\";s:12:\"CACHE_FILTER\";s:1:\"N\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:20:\"PREVIEW_TRUNCATE_LEN\";s:0:\"\";s:18:\"ACTIVE_DATE_FORMAT\";s:5:\"d.m.Y\";s:9:\"SET_TITLE\";s:1:\"N\";s:17:\"SET_BROWSER_TITLE\";s:1:\"N\";s:17:\"SET_META_KEYWORDS\";s:1:\"N\";s:20:\"SET_META_DESCRIPTION\";s:1:\"N\";s:17:\"SET_LAST_MODIFIED\";s:1:\"N\";s:25:\"INCLUDE_IBLOCK_INTO_CHAIN\";s:1:\"N\";s:18:\"ADD_SECTIONS_CHAIN\";s:1:\"N\";s:24:\"HIDE_LINK_WHEN_NO_DETAIL\";s:1:\"N\";s:14:\"PARENT_SECTION\";s:0:\"\";s:19:\"PARENT_SECTION_CODE\";s:0:\"\";s:19:\"INCLUDE_SUBSECTIONS\";s:1:\"N\";s:20:\"STRICT_SECTION_CHECK\";s:1:\"N\";s:12:\"DISPLAY_DATE\";s:1:\"Y\";s:12:\"DISPLAY_NAME\";s:1:\"Y\";s:15:\"DISPLAY_PICTURE\";s:1:\"Y\";s:20:\"DISPLAY_PREVIEW_TEXT\";s:1:\"Y\";s:14:\"PAGER_TEMPLATE\";s:8:\".default\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"Y\";s:11:\"PAGER_TITLE\";s:14:\"Новости\";s:17:\"PAGER_SHOW_ALWAYS\";s:1:\"N\";s:20:\"PAGER_DESC_NUMBERING\";s:1:\"N\";s:31:\"PAGER_DESC_NUMBERING_CACHE_TIME\";s:5:\"36000\";s:14:\"PAGER_SHOW_ALL\";s:1:\"N\";s:22:\"PAGER_BASE_LINK_ENABLE\";s:1:\"N\";s:14:\"SET_STATUS_404\";s:1:\"N\";s:8:\"SHOW_404\";s:1:\"N\";s:11:\"MESSAGE_404\";s:0:\"\";}'),
(36, 's1', 'bitrix:breadcrumb', 'breadcrumb', '/kontakty/index.php', 'N', NULL, 116, 555, 'a:4:{s:18:\"COMPONENT_TEMPLATE\";s:8:\".default\";s:10:\"START_FROM\";s:1:\"0\";s:4:\"PATH\";s:0:\"\";s:7:\"SITE_ID\";s:2:\"s1\";}'),
(37, 's1', 'bitrix:menu', '', '/index.php', 'N', NULL, 695, 1043, 'a:10:{s:18:\"ALLOW_MULTI_SELECT\";s:1:\"N\";s:15:\"CHILD_MENU_TYPE\";s:4:\"left\";s:5:\"DELAY\";s:1:\"N\";s:9:\"MAX_LEVEL\";s:1:\"1\";s:19:\"MENU_CACHE_GET_VARS\";a:1:{i:0;s:0:\"\";}s:15:\"MENU_CACHE_TIME\";s:4:\"3600\";s:15:\"MENU_CACHE_TYPE\";s:1:\"A\";s:21:\"MENU_CACHE_USE_GROUPS\";s:1:\"Y\";s:14:\"ROOT_MENU_TYPE\";s:4:\"left\";s:7:\"USE_EXT\";s:1:\"N\";}'),
(39, 's1', 'bitrix:menu', 'menu_header', '/bitrix/templates/avtomir/header.php', 'N', NULL, 3937, 4678, 'a:11:{s:18:\"ALLOW_MULTI_SELECT\";s:1:\"N\";s:15:\"CHILD_MENU_TYPE\";s:4:\"left\";s:5:\"DELAY\";s:1:\"N\";s:9:\"MAX_LEVEL\";s:1:\"1\";s:19:\"MENU_CACHE_GET_VARS\";s:0:\"\";s:15:\"MENU_CACHE_TIME\";s:4:\"3600\";s:15:\"MENU_CACHE_TYPE\";s:1:\"A\";s:21:\"MENU_CACHE_USE_GROUPS\";s:1:\"Y\";s:14:\"ROOT_MENU_TYPE\";s:4:\"left\";s:7:\"USE_EXT\";s:1:\"N\";s:18:\"COMPONENT_TEMPLATE\";s:8:\".default\";}');

-- --------------------------------------------------------

--
-- Структура таблицы `b_consent_agreement`
--

CREATE TABLE `b_consent_agreement` (
  `ID` int(18) NOT NULL,
  `CODE` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_INSERT` datetime NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATA_PROVIDER` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AGREEMENT_TEXT` longtext COLLATE utf8_unicode_ci,
  `LABEL_TEXT` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECURITY_CODE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_consent_field`
--

CREATE TABLE `b_consent_field` (
  `ID` int(18) NOT NULL,
  `AGREEMENT_ID` int(18) NOT NULL,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_consent_user_consent`
--

CREATE TABLE `b_consent_user_consent` (
  `ID` int(18) NOT NULL,
  `DATE_INSERT` datetime NOT NULL,
  `AGREEMENT_ID` int(18) NOT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORIGIN_ID` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORIGINATOR_ID` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_counter_data`
--

CREATE TABLE `b_counter_data` (
  `ID` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `DATA` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_culture`
--

CREATE TABLE `b_culture` (
  `ID` int(11) NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(1) DEFAULT '1',
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_culture`
--

INSERT INTO `b_culture` (`ID`, `CODE`, `NAME`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `DIRECTION`) VALUES
(1, 'ru', 'ru', 'DD.MM.YYYY', 'DD.MM.YYYY HH:MI:SS', '#NAME# #LAST_NAME#', 1, 'UTF-8', 'Y'),
(2, 'en', 'en', 'MM/DD/YYYY', 'MM/DD/YYYY H:MI:SS T', '#NAME# #LAST_NAME#', 0, 'UTF-8', 'Y');

-- --------------------------------------------------------

--
-- Структура таблицы `b_event`
--

CREATE TABLE `b_event` (
  `ID` int(18) NOT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` int(18) DEFAULT NULL,
  `LID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `C_FIELDS` longtext COLLATE utf8_unicode_ci,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DUPLICATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_attachment`
--

CREATE TABLE `b_event_attachment` (
  `EVENT_ID` int(18) NOT NULL,
  `FILE_ID` int(18) NOT NULL,
  `IS_FILE_COPIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_log`
--

CREATE TABLE `b_event_log` (
  `ID` int(18) NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `SEVERITY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `AUDIT_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` text COLLATE utf8_unicode_ci,
  `REQUEST_URI` text COLLATE utf8_unicode_ci,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `GUEST_ID` int(18) DEFAULT NULL,
  `DESCRIPTION` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_event_log`
--

INSERT INTO `b_event_log` (`ID`, `TIMESTAMP_X`, `SEVERITY`, `AUDIT_TYPE_ID`, `MODULE_ID`, `ITEM_ID`, `REMOTE_ADDR`, `USER_AGENT`, `REQUEST_URI`, `SITE_ID`, `USER_ID`, `GUEST_ID`, `DESCRIPTION`) VALUES
(1, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:1;s:4:\"CODE\";N;s:4:\"NAME\";s:5:\"GATES\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(2, NULL, 'WARNING', 'SITE_CHECKER_ERROR', 'main', 'D:/OpenServer/domains/avtomir45.ru', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/bitrix/admin/site_checker.php?HTTP_HOST=avtomir45.ru&SERVER_PORT=&HTTPS=&test_start=Y&lang=ru&step=36&global_test_vars=YTozOntzOjIwOiJzaXRlX2NoZWNrZXJfc3VjY2VzcyI7czoxOiJOIjtzOjE2OiJjaGVja19ieF9jcm9udGFiIjtiOjA7czoxMDoibGFzdF92YWx1ZSI7czo5OiJ0cmFuc2xhdGUiO30=', NULL, 1, NULL, ''),
(3, NULL, 'WARNING', 'SITE_CHECKER_ERROR', 'main', 'D:/OpenServer/domains/avtomir45.ru', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/bitrix/admin/site_checker.php?HTTP_HOST=avtomir45.ru&SERVER_PORT=&HTTPS=&test_start=Y&lang=ru&step=36&global_test_vars=YTozOntzOjIwOiJzaXRlX2NoZWNrZXJfc3VjY2VzcyI7czoxOiJOIjtzOjE2OiJjaGVja19ieF9jcm9udGFiIjtiOjE7czoxMDoibGFzdF92YWx1ZSI7czo5OiJ0cmFuc2xhdGUiO30=', NULL, 1, NULL, ''),
(4, NULL, 'WARNING', 'SITE_CHECKER_ERROR', 'main', 'D:/OpenServer/domains/avtomir45.ru', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/bitrix/admin/site_checker.php?HTTP_HOST=avtomir45.ru&SERVER_PORT=&HTTPS=&test_start=Y&lang=ru&step=36&global_test_vars=YTozOntzOjIwOiJzaXRlX2NoZWNrZXJfc3VjY2VzcyI7czoxOiJOIjtzOjE2OiJjaGVja19ieF9jcm9udGFiIjtiOjE7czoxMDoibGFzdF92YWx1ZSI7czo5OiJ0cmFuc2xhdGUiO30=', NULL, 1, NULL, ''),
(5, NULL, 'UNKNOWN', 'IBLOCK_SECTION_DELETE', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/bitrix/admin/iblock_section_admin.php?mode=frame&IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:1;s:4:\"CODE\";N;s:4:\"NAME\";s:5:\"GATES\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(6, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:2;s:4:\"CODE\";s:5:\"gates\";s:4:\"NAME\";s:5:\"GATES\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(7, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:3;s:4:\"CODE\";s:3:\"mmc\";s:4:\"NAME\";s:3:\"MMC\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(8, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:4;s:4:\"CODE\";s:6:\"toyota\";s:4:\"NAME\";s:6:\"TOYOTA\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(9, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:2;s:4:\"CODE\";s:5:\"gates\";s:4:\"NAME\";s:5:\"GATES\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(10, NULL, 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=avtomir&newFolder=Y&path=%2F&back_url=%2F&siteTemplateId=avtomir', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:17:\"katalog/index.php\";}'),
(11, NULL, 'UNKNOWN', 'SECTION_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=avtomir&newFolder=Y&path=%2F&back_url=%2F&siteTemplateId=avtomir', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:7:\"katalog\";}'),
(12, NULL, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:17:\"katalog/index.php\";}'),
(13, NULL, 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=avtomir&path=%2Fkatalog%2F&back_url=%2Fkatalog%2F%3Fclear_cache%3DY&siteTemplateId=avtomir', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:17:\"katalog/tovar.php\";}'),
(14, NULL, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:17:\"katalog/tovar.php\";}'),
(15, NULL, 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=avtomir&path=%2Fkatalog%2F&back_url=%2Fkatalog%2Ftovar.php%3Fclear_cache%3DY&siteTemplateId=avtomir', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:20:\"katalog/category.php\";}'),
(16, NULL, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:20:\"katalog/category.php\";}'),
(17, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:2;s:4:\"CODE\";s:5:\"gates\";s:4:\"NAME\";s:5:\"GATES\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(18, NULL, 'WARNING', 'SITE_CHECKER_ERROR', 'main', 'D:/OpenServer/domains/avtomir45.ru', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/site_checker.php?HTTP_HOST=avtomir45.ru&SERVER_PORT=&HTTPS=&test_start=Y&lang=ru&step=36&global_test_vars=YTozOntzOjIwOiJzaXRlX2NoZWNrZXJfc3VjY2VzcyI7czoxOiJOIjtzOjE2OiJjaGVja19ieF9jcm9udGFiIjtiOjA7czoxMDoibGFzdF92YWx1ZSI7czo5OiJ0cmFuc2xhdGUiO30=', NULL, 1, NULL, ''),
(19, NULL, 'WARNING', 'SITE_CHECKER_ERROR', 'main', 'D:/OpenServer/domains/avtomir45.ru', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/site_checker.php?HTTP_HOST=avtomir45.ru&SERVER_PORT=&HTTPS=&test_start=Y&lang=ru&step=36&global_test_vars=YTozOntzOjIwOiJzaXRlX2NoZWNrZXJfc3VjY2VzcyI7czoxOiJOIjtzOjE2OiJjaGVja19ieF9jcm9udGFiIjtiOjA7czoxMDoibGFzdF92YWx1ZSI7czo5OiJ0cmFuc2xhdGUiO30=', NULL, 1, NULL, ''),
(20, NULL, 'WARNING', 'SITE_CHECKER_ERROR', 'main', 'D:/OpenServer/domains/avtomir45.ru', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/site_checker.php?HTTP_HOST=avtomir45.ru&SERVER_PORT=&HTTPS=&test_start=Y&lang=ru&step=36&global_test_vars=YTozOntzOjIwOiJzaXRlX2NoZWNrZXJfc3VjY2VzcyI7czoxOiJOIjtzOjE2OiJjaGVja19ieF9jcm9udGFiIjtiOjA7czoxMDoibGFzdF92YWx1ZSI7czo5OiJ0cmFuc2xhdGUiO30=', NULL, 1, NULL, ''),
(21, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:2;s:4:\"CODE\";s:5:\"gates\";s:4:\"NAME\";s:5:\"GATES\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(22, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:1;s:4:\"CODE\";N;s:4:\"NAME\";s:0:\"\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(23, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:3;s:4:\"CODE\";s:3:\"mmc\";s:4:\"NAME\";s:3:\"MMC\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(24, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:4;s:4:\"CODE\";s:6:\"toyota\";s:4:\"NAME\";s:6:\"TOYOTA\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(25, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:5;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"VERNET\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(26, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:6;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"DEPO\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(27, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:7;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"NISSAN\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(28, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:8;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"OCAP\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(29, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:9;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"OPEL\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(30, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:2;s:4:\"CODE\";s:5:\"gates\";s:4:\"NAME\";s:5:\"GATES\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(31, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:1;s:4:\"CODE\";N;s:4:\"NAME\";s:0:\"\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(32, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:3;s:4:\"CODE\";s:3:\"mmc\";s:4:\"NAME\";s:3:\"MMC\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(33, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:4;s:4:\"CODE\";s:6:\"toyota\";s:4:\"NAME\";s:6:\"TOYOTA\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(34, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:5;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"VERNET\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(35, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:6;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"DEPO\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(36, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:7;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"NISSAN\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(37, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:8;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"OCAP\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(38, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:9;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"OPEL\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(39, NULL, 'UNKNOWN', 'IBLOCK_SECTION_DELETE', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_admin.php?mode=frame&IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:8;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"OCAP\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(40, NULL, 'UNKNOWN', 'IBLOCK_SECTION_DELETE', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_admin.php?mode=frame&IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:9;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"OPEL\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(41, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_DELETE', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_admin.php?mode=frame&IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:1;s:4:\"CODE\";N;s:4:\"NAME\";s:0:\"\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(42, NULL, 'UNKNOWN', 'IBLOCK_SECTION_DELETE', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_admin.php?mode=frame&IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:2;s:4:\"CODE\";s:5:\"gates\";s:4:\"NAME\";s:5:\"GATES\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(43, NULL, 'UNKNOWN', 'IBLOCK_SECTION_DELETE', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_admin.php?mode=frame&IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:3;s:4:\"CODE\";s:3:\"mmc\";s:4:\"NAME\";s:3:\"MMC\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(44, NULL, 'UNKNOWN', 'IBLOCK_SECTION_DELETE', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_admin.php?mode=frame&IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:4;s:4:\"CODE\";s:6:\"toyota\";s:4:\"NAME\";s:6:\"TOYOTA\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(45, NULL, 'UNKNOWN', 'IBLOCK_SECTION_DELETE', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_admin.php?mode=frame&IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:5;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"VERNET\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(46, NULL, 'UNKNOWN', 'IBLOCK_SECTION_DELETE', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_admin.php?mode=frame&IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:6;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"DEPO\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(47, NULL, 'UNKNOWN', 'IBLOCK_SECTION_DELETE', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_admin.php?mode=frame&IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:7;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"NISSAN\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(48, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:10;s:4:\"CODE\";N;s:4:\"NAME\";s:5:\"GATES\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(49, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:2;s:4:\"CODE\";N;s:4:\"NAME\";s:0:\"\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(50, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:11;s:4:\"CODE\";N;s:4:\"NAME\";s:3:\"MMC\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(51, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:12;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"TOYOTA\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(52, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:13;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"VERNET\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(53, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:14;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"DEPO\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(54, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:15;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"NISSAN\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(55, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:16;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"OCAP\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(56, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:17;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"OPEL\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(57, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:18;s:4:\"CODE\";N;s:4:\"NAME\";s:0:\"\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(58, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:2;s:4:\"CODE\";N;s:4:\"NAME\";s:0:\"\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(59, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:10;s:4:\"CODE\";N;s:4:\"NAME\";s:5:\"GATES\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(60, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:11;s:4:\"CODE\";N;s:4:\"NAME\";s:3:\"MMC\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(61, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:12;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"TOYOTA\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(62, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:13;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"VERNET\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(63, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:14;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"DEPO\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(64, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:15;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"NISSAN\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(65, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:16;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"OCAP\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(66, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:17;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"OPEL\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(67, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:10;s:4:\"CODE\";N;s:4:\"NAME\";s:5:\"GATES\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(68, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:2;s:4:\"CODE\";N;s:4:\"NAME\";s:0:\"\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(69, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:11;s:4:\"CODE\";N;s:4:\"NAME\";s:3:\"MMC\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(70, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:12;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"TOYOTA\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(71, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:13;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"VERNET\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(72, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:14;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"DEPO\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(73, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:15;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"NISSAN\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(74, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:16;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"OCAP\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(75, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:17;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"OPEL\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(76, NULL, 'UNKNOWN', 'IBLOCK_SECTION_DELETE', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_admin.php?mode=frame&IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:18;s:4:\"CODE\";N;s:4:\"NAME\";s:0:\"\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(77, NULL, 'UNKNOWN', 'IBLOCK_SECTION_DELETE', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_admin.php?mode=frame&IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:14;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"DEPO\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(78, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_DELETE', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_admin.php?mode=frame&IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:2;s:4:\"CODE\";N;s:4:\"NAME\";s:0:\"\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(79, NULL, 'UNKNOWN', 'IBLOCK_SECTION_DELETE', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_admin.php?mode=frame&IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:10;s:4:\"CODE\";N;s:4:\"NAME\";s:5:\"GATES\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(80, NULL, 'UNKNOWN', 'IBLOCK_SECTION_DELETE', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_admin.php?mode=frame&IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:11;s:4:\"CODE\";N;s:4:\"NAME\";s:3:\"MMC\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(81, NULL, 'UNKNOWN', 'IBLOCK_SECTION_DELETE', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_admin.php?mode=frame&IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:15;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"NISSAN\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(82, NULL, 'UNKNOWN', 'IBLOCK_SECTION_DELETE', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_admin.php?mode=frame&IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:16;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"OCAP\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(83, NULL, 'UNKNOWN', 'IBLOCK_SECTION_DELETE', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_admin.php?mode=frame&IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:17;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"OPEL\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(84, NULL, 'UNKNOWN', 'IBLOCK_SECTION_DELETE', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_admin.php?mode=frame&IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:12;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"TOYOTA\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(85, NULL, 'UNKNOWN', 'IBLOCK_SECTION_DELETE', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_admin.php?mode=frame&IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:13;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"VERNET\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(86, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:19;s:4:\"CODE\";N;s:4:\"NAME\";s:5:\"GATES\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(87, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:3;s:4:\"CODE\";N;s:4:\"NAME\";s:0:\"\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(88, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:20;s:4:\"CODE\";N;s:4:\"NAME\";s:3:\"MMC\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(89, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:21;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"TOYOTA\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(90, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:22;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"VERNET\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(91, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:23;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"DEPO\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(92, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:24;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"NISSAN\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(93, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:25;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"OCAP\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(94, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:26;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"OPEL\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(95, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:3;s:4:\"CODE\";N;s:4:\"NAME\";s:0:\"\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(96, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:19;s:4:\"CODE\";N;s:4:\"NAME\";s:5:\"GATES\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(97, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:3;s:4:\"CODE\";N;s:4:\"NAME\";s:0:\"\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(98, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:20;s:4:\"CODE\";N;s:4:\"NAME\";s:3:\"MMC\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(99, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:21;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"TOYOTA\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(100, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:22;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"VERNET\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(101, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:23;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"DEPO\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(102, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:24;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"NISSAN\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(103, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:25;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"OCAP\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(104, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:26;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"OPEL\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(105, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:27;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"FRAM\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(106, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:28;s:4:\"CODE\";N;s:4:\"NAME\";s:5:\"BOSCH\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(107, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:29;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"FEBI\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(108, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:30;s:4:\"CODE\";N;s:4:\"NAME\";s:9:\"MTF Light\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(109, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:31;s:4:\"CODE\";N;s:4:\"NAME\";s:8:\"NORPLAST\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}');
INSERT INTO `b_event_log` (`ID`, `TIMESTAMP_X`, `SEVERITY`, `AUDIT_TYPE_ID`, `MODULE_ID`, `ITEM_ID`, `REMOTE_ADDR`, `USER_AGENT`, `REQUEST_URI`, `SITE_ID`, `USER_ID`, `GUEST_ID`, `DESCRIPTION`) VALUES
(110, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:32;s:4:\"CODE\";N;s:4:\"NAME\";s:3:\"SVS\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(111, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:33;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"ALFECO\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(112, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:34;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"SLIM\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(113, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:35;s:4:\"CODE\";N;s:4:\"NAME\";s:11:\"AIR COUTURE\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(114, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:36;s:4:\"CODE\";N;s:4:\"NAME\";s:7:\"AIRLINE\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(115, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:37;s:4:\"CODE\";N;s:4:\"NAME\";s:7:\"AILERON\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(116, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:38;s:4:\"CODE\";N;s:4:\"NAME\";s:7:\"CARMATE\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(117, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:39;s:4:\"CODE\";N;s:4:\"NAME\";s:3:\"SIM\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(118, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:40;s:4:\"CODE\";N;s:4:\"NAME\";s:0:\"\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(119, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:40;s:4:\"CODE\";N;s:4:\"NAME\";s:0:\"\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(120, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:40;s:4:\"CODE\";N;s:4:\"NAME\";s:0:\"\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(121, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:19;s:4:\"CODE\";N;s:4:\"NAME\";s:5:\"GATES\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(122, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:4;s:4:\"CODE\";N;s:4:\"NAME\";s:62:\"Ремень ручейковый GATES 4PK948 MMC Pajero 3.0i\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(123, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:5;s:4:\"CODE\";N;s:4:\"NAME\";s:62:\"Ремень ручейковый GATES 4PK993 MMC Pajero 3.5i\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(124, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:6;s:4:\"CODE\";N;s:4:\"NAME\";s:73:\"Ремень ручейковый GATES 4PK1063 MMC Pajero 3.5i (4PK1063)\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(125, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:7;s:4:\"CODE\";N;s:4:\"NAME\";s:62:\"Ремень генератора GATES 6462MC MMC Pajero 3.0i\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(126, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:8;s:4:\"CODE\";N;s:4:\"NAME\";s:70:\"Ремень ручейковый GATES 5PK1123 MMC Pajero 3.0i 91&gt;\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(127, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:9;s:4:\"CODE\";N;s:4:\"NAME\";s:69:\"Ремень генератора GATES 6220MC TOYOTA L.Cr.FJ80 4.2TD\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(128, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:10;s:4:\"CODE\";N;s:4:\"NAME\";s:52:\"Ремень ГРМ GATES 5228XS MMC Pajero 3.0i -94\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(129, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:20;s:4:\"CODE\";N;s:4:\"NAME\";s:3:\"MMC\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(130, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:11;s:4:\"CODE\";N;s:4:\"NAME\";s:56:\"Ремень ГРМ MMC MD111427 MMC Pajero 3.0 -94 SOHC\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(131, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:12;s:4:\"CODE\";N;s:4:\"NAME\";s:56:\"Ремень ГРМ MMC MD307487 MMC Pajero 3.0 94- SOHC\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(132, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:21;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"TOYOTA\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(133, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:13;s:4:\"CODE\";N;s:4:\"NAME\";s:68:\"Ремень ГРМ TOYOTA 1356819065 (94*25,4) L.Cr.FJ80/100 HZ HDT\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(134, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:14;s:4:\"CODE\";N;s:4:\"NAME\";s:67:\"Ремень генератора GATES 6467MC MMC Pajero 3.0i 3.5i\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(135, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:15;s:4:\"CODE\";N;s:4:\"NAME\";s:72:\"Ремень генератора GATES 6478MC TOYOTA 4-Ranner 3.0 2.4TD\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(136, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:16;s:4:\"CODE\";N;s:4:\"NAME\";s:69:\"Ремень генератора GATES 6481MC TOYOTA L.Cr.FJ80 4.2TD\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(137, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:22;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"VERNET\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(138, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:17;s:4:\"CODE\";N;s:4:\"NAME\";s:89:\"Термостат VERNET TH627387J VW Passat 1.6/1.9TD/2.3 86-00/Audi 80/A4/A6 1.9TD 96-\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(139, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:23;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"DEPO\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(140, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:18;s:4:\"CODE\";N;s:4:\"NAME\";s:58:\"Поворотник DEPO 2131515RA ISUZU Trooper 92&gt; R\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(141, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:19;s:4:\"CODE\";N;s:4:\"NAME\";s:45:\"Фонарь MMC MR124963 MMC Pajero 93&gt; L\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(142, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:20;s:4:\"CODE\";N;s:4:\"NAME\";s:66:\"Амортизатор TOYOTA 4851139766 4 Run.-95 пер. газ.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(143, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:21;s:4:\"CODE\";N;s:4:\"NAME\";s:64:\"Амортизатор TOYOTA 4851169435 TOYOTA L.Cr.-80 пер.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(144, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:22;s:4:\"CODE\";N;s:4:\"NAME\";s:54:\"Втулка рессоры MMC MB111203 Pajero 84&gt;\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(145, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:23;s:4:\"CODE\";N;s:4:\"NAME\";s:54:\"Втулка рессоры MMC MB584530 Pajero 91&gt;\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(146, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:24;s:4:\"CODE\";N;s:4:\"NAME\";s:54:\"Втулка рессоры MMC MB584531 Pajero 91&gt;\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(147, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:25;s:4:\"CODE\";N;s:4:\"NAME\";s:59:\"Тяга стабил. MMC MB598098 M.Pajero 5дв задн\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(148, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:24;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"NISSAN\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(149, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:26;s:4:\"CODE\";N;s:4:\"NAME\";s:65:\"Втулка стабил. NISSAN 546137F001 Terrano-II задн.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(150, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:27;s:4:\"CODE\";N;s:4:\"NAME\";s:83:\"Втулка стабил. NISSAN 54613VB010 Patrol Y61 задн. &gt;2000г 18мм\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(151, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:28;s:4:\"CODE\";N;s:4:\"NAME\";s:74:\"Втулка стабил. TOYOTA 4881520200 D25 4 Runnner 92-95 задн.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(152, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:29;s:4:\"CODE\";N;s:4:\"NAME\";s:81:\"Втулка стабил. TOYOTA 4881526020 D25 Ln.Cruiser FJ80 08/92- задн.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(153, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:30;s:4:\"CODE\";N;s:4:\"NAME\";s:64:\"Втулка стабил. TOYOTA 4881530070 D16 4-Run задн.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(154, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:31;s:4:\"CODE\";N;s:4:\"NAME\";s:101:\"Втулка стабил. концевая MMC MB831039 Pajero 91&gt; (2шт+2шайбы+гайка)\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(155, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:32;s:4:\"CODE\";N;s:4:\"NAME\";s:76:\"Втулка стабил. концевая NISSAN 56112V0100 Patrol,Terrano\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(156, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:33;s:4:\"CODE\";N;s:4:\"NAME\";s:77:\"Втулка стабил. концевая TOYOTA 4881730010 Ln.Cruiser FJ80\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(157, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:34;s:4:\"CODE\";N;s:4:\"NAME\";s:71:\"Втулка стабил. концевая TOYOTA 4881730020 4 Run 93-\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(158, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:35;s:4:\"CODE\";N;s:4:\"NAME\";s:70:\"Втулка стабил. концевая TOYOTA 9094801002 4 Runner\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(159, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:36;s:4:\"CODE\";N;s:4:\"NAME\";s:61:\"Втулка стабил. MMC MR150092 Pajero 91&gt; пер.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(160, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:37;s:4:\"CODE\";N;s:4:\"NAME\";s:61:\"Втулка стабил. MMC MR150093 Pajero 91&gt; пер.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(161, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:38;s:4:\"CODE\";N;s:4:\"NAME\";s:68:\"Втулка стабил. MMC MR150095 Pajero 5 дв 94&gt; пер.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(162, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:39;s:4:\"CODE\";N;s:4:\"NAME\";s:65:\"Втулка стабил. NISSAN 5461342G00 Terrano 2.4i пер.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(163, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:40;s:4:\"CODE\";N;s:4:\"NAME\";s:83:\"Втулка стабил. NISSAN 5461388G00 Terrano 2.4i/3.0i/2.7TD 89&gt; пер.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(164, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:41;s:4:\"CODE\";N;s:4:\"NAME\";s:70:\"Втулка стабил. NISSAN 546139C105 NISSAN Terrano II пер.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(165, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:42;s:4:\"CODE\";N;s:4:\"NAME\";s:63:\"Втулка стабил. NISSAN 54613VB002 Patrol Y61 пер.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(166, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:43;s:4:\"CODE\";N;s:4:\"NAME\";s:71:\"Втулка стабил. TOYOTA 4881526250 D23 Ln.Cruiser 100 зад.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(167, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:44;s:4:\"CODE\";N;s:4:\"NAME\";s:72:\"Втулка стабил. TOYOTA 4881528080 D24 Ln.Cruiser FJ80 пер.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(168, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:45;s:4:\"CODE\";N;s:4:\"NAME\";s:65:\"Втулка стабил. TOYOTA 4881530040 D20 Carina E пер.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(169, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:46;s:4:\"CODE\";N;s:4:\"NAME\";s:71:\"Втулка стабил. TOYOTA 4881535070 D27 4 Runner 92-95 пер.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(170, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:47;s:4:\"CODE\";N;s:4:\"NAME\";s:68:\"Втулка стабил. TOYOTA 4881560040 D26 Ln.Cr. FJ80 пер.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(171, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:48;s:4:\"CODE\";N;s:4:\"NAME\";s:68:\"Втулка стабил. TOYOTA 4881560050 D24 Ln.Cr. FJ80 пер.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(172, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:49;s:4:\"CODE\";N;s:4:\"NAME\";s:68:\"Втулка стабил. TOYOTA 4881560070 D29 Ln.Cr. FJ80 пер.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(173, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:50;s:4:\"CODE\";N;s:4:\"NAME\";s:67:\"Втулка стабил. TOYOTA 4881560111 D27 Ln.Cr. 100 пер.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(174, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:51;s:4:\"CODE\";N;s:4:\"NAME\";s:56:\"Тяга стабил. MMC MR267876 Pajero 6/93 пер.L\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(175, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:52;s:4:\"CODE\";N;s:4:\"NAME\";s:56:\"Тяга стабил. MMC MR267877 Pajero 6/93 пер.R\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(176, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:53;s:4:\"CODE\";N;s:4:\"NAME\";s:68:\"Опора шаровая MMC MB860829 MMC Pajero 91&gt; верх. L\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(177, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:54;s:4:\"CODE\";N;s:4:\"NAME\";s:68:\"Опора шаровая MMC MB860830 MMC Pajero 91&gt; верх. R\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(178, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:55;s:4:\"CODE\";N;s:4:\"NAME\";s:66:\"Опора шаровая MMC MR296269 MMC Pajero 91&gt; ниж. L\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(179, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:56;s:4:\"CODE\";N;s:4:\"NAME\";s:66:\"Опора шаровая MMC MR296270 MMC Pajero 91&gt; ниж. R\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(180, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:57;s:4:\"CODE\";N;s:4:\"NAME\";s:62:\"С/блок MMC MB109684 M.Pajero 91&gt; пер.ниж.рыч.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(181, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:58;s:4:\"CODE\";N;s:4:\"NAME\";s:58:\"С/блок MMC MB631492 M.Pajero 91-6/93 задн.рыч.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(182, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:59;s:4:\"CODE\";N;s:4:\"NAME\";s:59:\"С/блок MMC MR112891 M.Pajero 6/93&gt; задн.рыч.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(183, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:25;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"OCAP\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(184, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:60;s:4:\"CODE\";N;s:4:\"NAME\";s:80:\"Наконечник рулевой OCAP 0193759 TOYOTA 4-Runner внешний.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(185, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:61;s:4:\"CODE\";N;s:4:\"NAME\";s:65:\"Наконечник рулевой TOYOTA 4504669135 L.Cr.FJ80 R\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(186, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:62;s:4:\"CODE\";N;s:4:\"NAME\";s:65:\"Наконечник рулевой TOYOTA 4504769085 L.Cr.FJ80 L\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(187, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:26;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"OPEL\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(188, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:63;s:4:\"CODE\";N;s:4:\"NAME\";s:58:\"Подушка глушителя OPEL 0856024 OPEL Diesel\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(189, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:64;s:4:\"CODE\";N;s:4:\"NAME\";s:69:\"Ремк-т MMC MB858466 MMC Pajero 91&gt; суппорта задн.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(190, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:65;s:4:\"CODE\";N;s:4:\"NAME\";s:71:\"Корзина сцепления MMC MR317682 MMC  (D250) Pajero 2.8TD\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(191, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:66;s:4:\"CODE\";N;s:4:\"NAME\";s:65:\"Сальник MMC MB160578 42*65*12 MMC Pajero пер.моста\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(192, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:67;s:4:\"CODE\";N;s:4:\"NAME\";s:73:\"Сальник раздатки MMC MB919210 MMC Pajero на кардан\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(193, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:27;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"FRAM\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(194, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:68;s:4:\"CODE\";N;s:4:\"NAME\";s:81:\"Фильтр масляный FRAM PH3614 TOYOTA, Chrysler Voyager 2.4 ВОЛГА\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(195, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:69;s:4:\"CODE\";N;s:4:\"NAME\";s:51:\"Фильтр масляный FRAM PH6355 MMC 2.5TD\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(196, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:28;s:4:\"CODE\";N;s:4:\"NAME\";s:5:\"BOSCH\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(197, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:70;s:4:\"CODE\";N;s:4:\"NAME\";s:63:\"Фильтр масляный BOSCH 0986452063 MMC Pajero 2.8TD\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(198, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:29;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"FEBI\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(199, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:71;s:4:\"CODE\";N;s:4:\"NAME\";s:75:\"Антифриз FEBI 01089 синий 1.5L концентрат 1:1 -40°C\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(200, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:72;s:4:\"CODE\";N;s:4:\"NAME\";s:69:\"Фильтр топливный MMC MB220900 MMC Pajero 2.5TD 2.8D TD\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(201, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:73;s:4:\"CODE\";N;s:4:\"NAME\";s:48:\"Провода в/в MMC MD311208 MMC Pajero 3.5\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(202, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:74;s:4:\"CODE\";N;s:4:\"NAME\";s:73:\"Свеча зажигания TOYOTA 9091901176 K16RU T.L.Cr.-80 4-Runner\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(203, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:30;s:4:\"CODE\";N;s:4:\"NAME\";s:9:\"MTF Light\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(204, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:75;s:4:\"CODE\";N;s:4:\"NAME\";s:99:\"Лампа MTF Light HVN1203 VANADIUM бело-голубой 5000K 55W 12V комплект 2 ШТ\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(205, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:31;s:4:\"CODE\";N;s:4:\"NAME\";s:8:\"NORPLAST\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(206, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:76;s:4:\"CODE\";N;s:4:\"NAME\";s:133:\"Коврики а/м NORPLAST NPLPO6312 OPEL CORSA D 06--&gt; полиур-н черн. с борт. компл. 4шт с крепл.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(207, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:77;s:4:\"CODE\";N;s:4:\"NAME\";s:103:\"Лампа MTF Light H8A1211 ARGENTUM +80% больше света 4000K55W 12V комплект 2 ШТ\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(208, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:32;s:4:\"CODE\";N;s:4:\"NAME\";s:3:\"SVS\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(209, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:78;s:4:\"CODE\";N;s:4:\"NAME\";s:53:\"Лампа SVS 0210043000 5000K CLASSIC XENON 35W D4S\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(210, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:33;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"ALFECO\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(211, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:79;s:4:\"CODE\";N;s:4:\"NAME\";s:167:\"Защита двигателя ALFECO 1402 MMC LANCER X 07--&gt;; ASX 1.8 10---&gt; OUTLANDER XL 06--12  /DELICA D5 07--&gt; +  КПП сталь 2мм с крепл.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(212, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:80;s:4:\"CODE\";N;s:4:\"NAME\";s:123:\"Коврики а/м NORPLAST NPLPO6438 PEUGEOT 308 08--&gt;  полиуретан черн. с борт. компл. 4шт\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(213, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:81;s:4:\"CODE\";N;s:4:\"NAME\";s:126:\"Коврики а/м NORPLAST NPLPO9523 VW JETTA 05--10 полиур. черн. с борт компл. 4 шт. с крепл.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}');
INSERT INTO `b_event_log` (`ID`, `TIMESTAMP_X`, `SEVERITY`, `AUDIT_TYPE_ID`, `MODULE_ID`, `ITEM_ID`, `REMOTE_ADDR`, `USER_AGENT`, `REQUEST_URI`, `SITE_ID`, `USER_ID`, `GUEST_ID`, `DESCRIPTION`) VALUES
(214, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:34;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"SLIM\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(215, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:82;s:4:\"CODE\";N;s:4:\"NAME\";s:105:\"Освежитель на дефлектор SLIM SLMV56 Зеленое яблоко 8 мл  жидкий\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(216, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:83;s:4:\"CODE\";N;s:4:\"NAME\";s:146:\"Коврики а/м NORPLAST NPLPO5621 MB MERCEDES-BENZ W210   95-02 полиуретан черн. с борт. компл 4шт. с крепл.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(217, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:84;s:4:\"CODE\";N;s:4:\"NAME\";s:119:\"Коврики а/м NORPLAST NPLPO6426 PEUGEOT 206 98--09 полиуретан черн.с борт. компл. 4шт\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(218, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:35;s:4:\"CODE\";N;s:4:\"NAME\";s:11:\"AIR COUTURE\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(219, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:85;s:4:\"CODE\";N;s:4:\"NAME\";s:94:\"Освежитель подвесной AIR COUTURE AIR5 аромат FAHRENHEIT Cristian Dior\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(220, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:36;s:4:\"CODE\";N;s:4:\"NAME\";s:7:\"AIRLINE\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(221, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:86;s:4:\"CODE\";N;s:4:\"NAME\";s:141:\"Устройство зарядное AIRLINE ACHM01 унив. для моб. телефонов 8 в 1,  12в/24в, шнур -рулетка\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(222, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:87;s:4:\"CODE\";N;s:4:\"NAME\";s:105:\"Освежитель подвесной AIR COUTURE AIR11 аромат S.T.DUPONT ESSENCE PURE Pour Homme\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(223, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:88;s:4:\"CODE\";N;s:4:\"NAME\";s:138:\"Коврики а/м NORPLAST NPLPO8548 SUZUKI SWIFT 10--&gt; полиуретан черн. с борт. компл. 4шт с крепл.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(224, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:89;s:4:\"CODE\";N;s:4:\"NAME\";s:97:\"Освежитель подвесной AIR COUTURE AIR3 аромат ACQUA DI GIO Giorgio Armani\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(225, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:90;s:4:\"CODE\";N;s:4:\"NAME\";s:84:\"Освежитель подвесной AIR COUTURE AIR15 аромат CHROME Azzaro\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(226, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:91;s:4:\"CODE\";N;s:4:\"NAME\";s:140:\"Коврики а/м NORPLAST NPLPO1209 CHEVROLET EPICA 06--&gt;полиуретан черн. с борт. крмпл. 4шт с крепл.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(227, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:37;s:4:\"CODE\";N;s:4:\"NAME\";s:7:\"AILERON\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(228, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:92;s:4:\"CODE\";N;s:4:\"NAME\";s:117:\"Коврики а/м AILERON 61501 RENAULT LOGAN 06--14 полиуретан черн. с борт. компл. 4шт\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(229, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:38;s:4:\"CODE\";N;s:4:\"NAME\";s:7:\"CARMATE\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(230, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:93;s:4:\"CODE\";N;s:4:\"NAME\";s:188:\"Освежитель кондиционера CARMATE D38RU с бактериц. эффектом. Устраняет неприятн. запахи. С ионами серебра. 40мл\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(231, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:94;s:4:\"CODE\";N;s:4:\"NAME\";s:142:\"Коврики а/м NORPLAST NPLPO5948 MMC PAJERO IV  07--&gt; полиуретан черн. с борт. компл. 4 шт. с крепл.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(232, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:39;s:4:\"CODE\";N;s:4:\"NAME\";s:3:\"SIM\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(233, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:95;s:4:\"CODE\";N;s:4:\"NAME\";s:101:\"Дефлектор SIM SVOTIG0832 окон VW TIGUAN 08--&gt; клеящ. компл. 4шт темн.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(234, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:96;s:4:\"CODE\";N;s:4:\"NAME\";s:137:\"Коврики а/м NORPLAST NPLPO0706 BMW X5 E70 07--13/X6 E71; E72 08--&gt; полиуретан черн. с борт. с крепл.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(235, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:41;s:4:\"CODE\";N;s:4:\"NAME\";s:12:\"РОССИЯ\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(236, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:97;s:4:\"CODE\";N;s:4:\"NAME\";s:122:\"Знак аварийной остановки РОССИЯ 25724 металл. ДИАЛУЧ соотв. ГОСТ (108104)\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(237, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:42;s:4:\"CODE\";N;s:4:\"NAME\";s:10:\"ЗЕБРА\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(238, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:98;s:4:\"CODE\";N;s:4:\"NAME\";s:71:\"Изолента ЗЕБРА 6320 19мм х 25м черная Китай\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(239, NULL, 'UNKNOWN', 'IBLOCK_SECTION_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:43;s:4:\"CODE\";N;s:4:\"NAME\";s:12:\"ДиаЛУЧ\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(240, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:99;s:4:\"CODE\";N;s:4:\"NAME\";s:103:\"Перчатки рабочие ДиаЛУЧ 25643 а/м белые с ПВХ высш.сорт (2шт)\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(241, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:100;s:4:\"CODE\";N;s:4:\"NAME\";s:144:\"Коврики а/м NORPLAST NPLPO9550 VW TIGUAN 08--&gt; 11--&gt; полиуретан черн. с борт. компл. 4шт с крепл.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(242, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:101;s:4:\"CODE\";N;s:4:\"NAME\";s:140:\"Коврики а/м NORPLAST NPLPO6310 OPEL ASTRA J 2010--&gt; полиуретан черн. с борт. компл. 4шт с крепл.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(243, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_ADD', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:102;s:4:\"CODE\";N;s:4:\"NAME\";s:123:\"Коврики а/м NORPLAST NPLPO6171 NISSAN TEANA 2008--13 полиуретан черн. с борт. компл. 4шт\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(244, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:19;s:4:\"CODE\";N;s:4:\"NAME\";s:5:\"GATES\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(245, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:4;s:4:\"CODE\";N;s:4:\"NAME\";s:62:\"Ремень ручейковый GATES 4PK948 MMC Pajero 3.0i\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(246, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:5;s:4:\"CODE\";N;s:4:\"NAME\";s:62:\"Ремень ручейковый GATES 4PK993 MMC Pajero 3.5i\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(247, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:6;s:4:\"CODE\";N;s:4:\"NAME\";s:73:\"Ремень ручейковый GATES 4PK1063 MMC Pajero 3.5i (4PK1063)\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(248, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:7;s:4:\"CODE\";N;s:4:\"NAME\";s:62:\"Ремень генератора GATES 6462MC MMC Pajero 3.0i\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(249, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:8;s:4:\"CODE\";N;s:4:\"NAME\";s:70:\"Ремень ручейковый GATES 5PK1123 MMC Pajero 3.0i 91&gt;\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(250, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:9;s:4:\"CODE\";N;s:4:\"NAME\";s:69:\"Ремень генератора GATES 6220MC TOYOTA L.Cr.FJ80 4.2TD\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(251, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:10;s:4:\"CODE\";N;s:4:\"NAME\";s:52:\"Ремень ГРМ GATES 5228XS MMC Pajero 3.0i -94\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(252, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:20;s:4:\"CODE\";N;s:4:\"NAME\";s:3:\"MMC\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(253, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:11;s:4:\"CODE\";N;s:4:\"NAME\";s:56:\"Ремень ГРМ MMC MD111427 MMC Pajero 3.0 -94 SOHC\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(254, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:12;s:4:\"CODE\";N;s:4:\"NAME\";s:56:\"Ремень ГРМ MMC MD307487 MMC Pajero 3.0 94- SOHC\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(255, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:21;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"TOYOTA\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(256, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:13;s:4:\"CODE\";N;s:4:\"NAME\";s:68:\"Ремень ГРМ TOYOTA 1356819065 (94*25,4) L.Cr.FJ80/100 HZ HDT\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(257, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:14;s:4:\"CODE\";N;s:4:\"NAME\";s:67:\"Ремень генератора GATES 6467MC MMC Pajero 3.0i 3.5i\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(258, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:15;s:4:\"CODE\";N;s:4:\"NAME\";s:72:\"Ремень генератора GATES 6478MC TOYOTA 4-Ranner 3.0 2.4TD\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(259, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:16;s:4:\"CODE\";N;s:4:\"NAME\";s:69:\"Ремень генератора GATES 6481MC TOYOTA L.Cr.FJ80 4.2TD\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(260, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:22;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"VERNET\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(261, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:17;s:4:\"CODE\";N;s:4:\"NAME\";s:89:\"Термостат VERNET TH627387J VW Passat 1.6/1.9TD/2.3 86-00/Audi 80/A4/A6 1.9TD 96-\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(262, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:23;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"DEPO\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(263, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:18;s:4:\"CODE\";N;s:4:\"NAME\";s:58:\"Поворотник DEPO 2131515RA ISUZU Trooper 92&gt; R\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(264, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:19;s:4:\"CODE\";N;s:4:\"NAME\";s:45:\"Фонарь MMC MR124963 MMC Pajero 93&gt; L\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(265, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:20;s:4:\"CODE\";N;s:4:\"NAME\";s:66:\"Амортизатор TOYOTA 4851139766 4 Run.-95 пер. газ.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(266, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:21;s:4:\"CODE\";N;s:4:\"NAME\";s:64:\"Амортизатор TOYOTA 4851169435 TOYOTA L.Cr.-80 пер.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(267, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:22;s:4:\"CODE\";N;s:4:\"NAME\";s:54:\"Втулка рессоры MMC MB111203 Pajero 84&gt;\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(268, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:23;s:4:\"CODE\";N;s:4:\"NAME\";s:54:\"Втулка рессоры MMC MB584530 Pajero 91&gt;\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(269, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:24;s:4:\"CODE\";N;s:4:\"NAME\";s:54:\"Втулка рессоры MMC MB584531 Pajero 91&gt;\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(270, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:25;s:4:\"CODE\";N;s:4:\"NAME\";s:59:\"Тяга стабил. MMC MB598098 M.Pajero 5дв задн\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(271, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:24;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"NISSAN\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(272, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:26;s:4:\"CODE\";N;s:4:\"NAME\";s:65:\"Втулка стабил. NISSAN 546137F001 Terrano-II задн.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(273, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:27;s:4:\"CODE\";N;s:4:\"NAME\";s:83:\"Втулка стабил. NISSAN 54613VB010 Patrol Y61 задн. &gt;2000г 18мм\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(274, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:28;s:4:\"CODE\";N;s:4:\"NAME\";s:74:\"Втулка стабил. TOYOTA 4881520200 D25 4 Runnner 92-95 задн.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(275, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:29;s:4:\"CODE\";N;s:4:\"NAME\";s:81:\"Втулка стабил. TOYOTA 4881526020 D25 Ln.Cruiser FJ80 08/92- задн.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(276, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:30;s:4:\"CODE\";N;s:4:\"NAME\";s:64:\"Втулка стабил. TOYOTA 4881530070 D16 4-Run задн.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(277, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:31;s:4:\"CODE\";N;s:4:\"NAME\";s:101:\"Втулка стабил. концевая MMC MB831039 Pajero 91&gt; (2шт+2шайбы+гайка)\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(278, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:32;s:4:\"CODE\";N;s:4:\"NAME\";s:76:\"Втулка стабил. концевая NISSAN 56112V0100 Patrol,Terrano\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(279, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:33;s:4:\"CODE\";N;s:4:\"NAME\";s:77:\"Втулка стабил. концевая TOYOTA 4881730010 Ln.Cruiser FJ80\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(280, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:34;s:4:\"CODE\";N;s:4:\"NAME\";s:71:\"Втулка стабил. концевая TOYOTA 4881730020 4 Run 93-\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(281, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:35;s:4:\"CODE\";N;s:4:\"NAME\";s:70:\"Втулка стабил. концевая TOYOTA 9094801002 4 Runner\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(282, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:36;s:4:\"CODE\";N;s:4:\"NAME\";s:61:\"Втулка стабил. MMC MR150092 Pajero 91&gt; пер.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(283, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:37;s:4:\"CODE\";N;s:4:\"NAME\";s:61:\"Втулка стабил. MMC MR150093 Pajero 91&gt; пер.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(284, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:38;s:4:\"CODE\";N;s:4:\"NAME\";s:68:\"Втулка стабил. MMC MR150095 Pajero 5 дв 94&gt; пер.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(285, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:39;s:4:\"CODE\";N;s:4:\"NAME\";s:65:\"Втулка стабил. NISSAN 5461342G00 Terrano 2.4i пер.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(286, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:40;s:4:\"CODE\";N;s:4:\"NAME\";s:83:\"Втулка стабил. NISSAN 5461388G00 Terrano 2.4i/3.0i/2.7TD 89&gt; пер.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(287, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:41;s:4:\"CODE\";N;s:4:\"NAME\";s:70:\"Втулка стабил. NISSAN 546139C105 NISSAN Terrano II пер.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(288, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:42;s:4:\"CODE\";N;s:4:\"NAME\";s:63:\"Втулка стабил. NISSAN 54613VB002 Patrol Y61 пер.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(289, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:43;s:4:\"CODE\";N;s:4:\"NAME\";s:71:\"Втулка стабил. TOYOTA 4881526250 D23 Ln.Cruiser 100 зад.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(290, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:44;s:4:\"CODE\";N;s:4:\"NAME\";s:72:\"Втулка стабил. TOYOTA 4881528080 D24 Ln.Cruiser FJ80 пер.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(291, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:45;s:4:\"CODE\";N;s:4:\"NAME\";s:65:\"Втулка стабил. TOYOTA 4881530040 D20 Carina E пер.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(292, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:46;s:4:\"CODE\";N;s:4:\"NAME\";s:71:\"Втулка стабил. TOYOTA 4881535070 D27 4 Runner 92-95 пер.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(293, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:47;s:4:\"CODE\";N;s:4:\"NAME\";s:68:\"Втулка стабил. TOYOTA 4881560040 D26 Ln.Cr. FJ80 пер.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(294, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:48;s:4:\"CODE\";N;s:4:\"NAME\";s:68:\"Втулка стабил. TOYOTA 4881560050 D24 Ln.Cr. FJ80 пер.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(295, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:49;s:4:\"CODE\";N;s:4:\"NAME\";s:68:\"Втулка стабил. TOYOTA 4881560070 D29 Ln.Cr. FJ80 пер.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(296, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:50;s:4:\"CODE\";N;s:4:\"NAME\";s:67:\"Втулка стабил. TOYOTA 4881560111 D27 Ln.Cr. 100 пер.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(297, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:51;s:4:\"CODE\";N;s:4:\"NAME\";s:56:\"Тяга стабил. MMC MR267876 Pajero 6/93 пер.L\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(298, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:52;s:4:\"CODE\";N;s:4:\"NAME\";s:56:\"Тяга стабил. MMC MR267877 Pajero 6/93 пер.R\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(299, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:53;s:4:\"CODE\";N;s:4:\"NAME\";s:68:\"Опора шаровая MMC MB860829 MMC Pajero 91&gt; верх. L\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(300, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:54;s:4:\"CODE\";N;s:4:\"NAME\";s:68:\"Опора шаровая MMC MB860830 MMC Pajero 91&gt; верх. R\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(301, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:55;s:4:\"CODE\";N;s:4:\"NAME\";s:66:\"Опора шаровая MMC MR296269 MMC Pajero 91&gt; ниж. L\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(302, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:56;s:4:\"CODE\";N;s:4:\"NAME\";s:66:\"Опора шаровая MMC MR296270 MMC Pajero 91&gt; ниж. R\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(303, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:57;s:4:\"CODE\";N;s:4:\"NAME\";s:62:\"С/блок MMC MB109684 M.Pajero 91&gt; пер.ниж.рыч.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(304, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:58;s:4:\"CODE\";N;s:4:\"NAME\";s:58:\"С/блок MMC MB631492 M.Pajero 91-6/93 задн.рыч.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(305, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:59;s:4:\"CODE\";N;s:4:\"NAME\";s:59:\"С/блок MMC MR112891 M.Pajero 6/93&gt; задн.рыч.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(306, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:25;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"OCAP\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(307, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:60;s:4:\"CODE\";N;s:4:\"NAME\";s:80:\"Наконечник рулевой OCAP 0193759 TOYOTA 4-Runner внешний.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(308, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:61;s:4:\"CODE\";N;s:4:\"NAME\";s:65:\"Наконечник рулевой TOYOTA 4504669135 L.Cr.FJ80 R\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(309, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:62;s:4:\"CODE\";N;s:4:\"NAME\";s:65:\"Наконечник рулевой TOYOTA 4504769085 L.Cr.FJ80 L\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(310, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:26;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"OPEL\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(311, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:63;s:4:\"CODE\";N;s:4:\"NAME\";s:58:\"Подушка глушителя OPEL 0856024 OPEL Diesel\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(312, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:64;s:4:\"CODE\";N;s:4:\"NAME\";s:69:\"Ремк-т MMC MB858466 MMC Pajero 91&gt; суппорта задн.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(313, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:65;s:4:\"CODE\";N;s:4:\"NAME\";s:71:\"Корзина сцепления MMC MR317682 MMC  (D250) Pajero 2.8TD\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(314, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:66;s:4:\"CODE\";N;s:4:\"NAME\";s:65:\"Сальник MMC MB160578 42*65*12 MMC Pajero пер.моста\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(315, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:67;s:4:\"CODE\";N;s:4:\"NAME\";s:73:\"Сальник раздатки MMC MB919210 MMC Pajero на кардан\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}');
INSERT INTO `b_event_log` (`ID`, `TIMESTAMP_X`, `SEVERITY`, `AUDIT_TYPE_ID`, `MODULE_ID`, `ITEM_ID`, `REMOTE_ADDR`, `USER_AGENT`, `REQUEST_URI`, `SITE_ID`, `USER_ID`, `GUEST_ID`, `DESCRIPTION`) VALUES
(316, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:27;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"FRAM\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(317, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:68;s:4:\"CODE\";N;s:4:\"NAME\";s:81:\"Фильтр масляный FRAM PH3614 TOYOTA, Chrysler Voyager 2.4 ВОЛГА\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(318, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:69;s:4:\"CODE\";N;s:4:\"NAME\";s:51:\"Фильтр масляный FRAM PH6355 MMC 2.5TD\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(319, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:28;s:4:\"CODE\";N;s:4:\"NAME\";s:5:\"BOSCH\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(320, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:70;s:4:\"CODE\";N;s:4:\"NAME\";s:63:\"Фильтр масляный BOSCH 0986452063 MMC Pajero 2.8TD\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(321, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:29;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"FEBI\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(322, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:71;s:4:\"CODE\";N;s:4:\"NAME\";s:75:\"Антифриз FEBI 01089 синий 1.5L концентрат 1:1 -40°C\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(323, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:72;s:4:\"CODE\";N;s:4:\"NAME\";s:69:\"Фильтр топливный MMC MB220900 MMC Pajero 2.5TD 2.8D TD\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(324, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:73;s:4:\"CODE\";N;s:4:\"NAME\";s:48:\"Провода в/в MMC MD311208 MMC Pajero 3.5\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(325, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:74;s:4:\"CODE\";N;s:4:\"NAME\";s:73:\"Свеча зажигания TOYOTA 9091901176 K16RU T.L.Cr.-80 4-Runner\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(326, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:30;s:4:\"CODE\";N;s:4:\"NAME\";s:9:\"MTF Light\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(327, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:75;s:4:\"CODE\";N;s:4:\"NAME\";s:99:\"Лампа MTF Light HVN1203 VANADIUM бело-голубой 5000K 55W 12V комплект 2 ШТ\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(328, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:31;s:4:\"CODE\";N;s:4:\"NAME\";s:8:\"NORPLAST\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(329, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:76;s:4:\"CODE\";N;s:4:\"NAME\";s:133:\"Коврики а/м NORPLAST NPLPO6312 OPEL CORSA D 06--&gt; полиур-н черн. с борт. компл. 4шт с крепл.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(330, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:77;s:4:\"CODE\";N;s:4:\"NAME\";s:103:\"Лампа MTF Light H8A1211 ARGENTUM +80% больше света 4000K55W 12V комплект 2 ШТ\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(331, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:32;s:4:\"CODE\";N;s:4:\"NAME\";s:3:\"SVS\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(332, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:78;s:4:\"CODE\";N;s:4:\"NAME\";s:53:\"Лампа SVS 0210043000 5000K CLASSIC XENON 35W D4S\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(333, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:33;s:4:\"CODE\";N;s:4:\"NAME\";s:6:\"ALFECO\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(334, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:79;s:4:\"CODE\";N;s:4:\"NAME\";s:167:\"Защита двигателя ALFECO 1402 MMC LANCER X 07--&gt;; ASX 1.8 10---&gt; OUTLANDER XL 06--12  /DELICA D5 07--&gt; +  КПП сталь 2мм с крепл.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(335, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:80;s:4:\"CODE\";N;s:4:\"NAME\";s:123:\"Коврики а/м NORPLAST NPLPO6438 PEUGEOT 308 08--&gt;  полиуретан черн. с борт. компл. 4шт\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(336, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:81;s:4:\"CODE\";N;s:4:\"NAME\";s:126:\"Коврики а/м NORPLAST NPLPO9523 VW JETTA 05--10 полиур. черн. с борт компл. 4 шт. с крепл.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(337, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:34;s:4:\"CODE\";N;s:4:\"NAME\";s:4:\"SLIM\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(338, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:82;s:4:\"CODE\";N;s:4:\"NAME\";s:105:\"Освежитель на дефлектор SLIM SLMV56 Зеленое яблоко 8 мл  жидкий\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(339, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:83;s:4:\"CODE\";N;s:4:\"NAME\";s:146:\"Коврики а/м NORPLAST NPLPO5621 MB MERCEDES-BENZ W210   95-02 полиуретан черн. с борт. компл 4шт. с крепл.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(340, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:84;s:4:\"CODE\";N;s:4:\"NAME\";s:119:\"Коврики а/м NORPLAST NPLPO6426 PEUGEOT 206 98--09 полиуретан черн.с борт. компл. 4шт\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(341, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:35;s:4:\"CODE\";N;s:4:\"NAME\";s:11:\"AIR COUTURE\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(342, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:85;s:4:\"CODE\";N;s:4:\"NAME\";s:94:\"Освежитель подвесной AIR COUTURE AIR5 аромат FAHRENHEIT Cristian Dior\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(343, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:36;s:4:\"CODE\";N;s:4:\"NAME\";s:7:\"AIRLINE\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(344, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:86;s:4:\"CODE\";N;s:4:\"NAME\";s:141:\"Устройство зарядное AIRLINE ACHM01 унив. для моб. телефонов 8 в 1,  12в/24в, шнур -рулетка\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(345, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:87;s:4:\"CODE\";N;s:4:\"NAME\";s:105:\"Освежитель подвесной AIR COUTURE AIR11 аромат S.T.DUPONT ESSENCE PURE Pour Homme\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(346, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:88;s:4:\"CODE\";N;s:4:\"NAME\";s:138:\"Коврики а/м NORPLAST NPLPO8548 SUZUKI SWIFT 10--&gt; полиуретан черн. с борт. компл. 4шт с крепл.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(347, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:89;s:4:\"CODE\";N;s:4:\"NAME\";s:97:\"Освежитель подвесной AIR COUTURE AIR3 аромат ACQUA DI GIO Giorgio Armani\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(348, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:90;s:4:\"CODE\";N;s:4:\"NAME\";s:84:\"Освежитель подвесной AIR COUTURE AIR15 аромат CHROME Azzaro\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(349, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:91;s:4:\"CODE\";N;s:4:\"NAME\";s:140:\"Коврики а/м NORPLAST NPLPO1209 CHEVROLET EPICA 06--&gt;полиуретан черн. с борт. крмпл. 4шт с крепл.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(350, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:37;s:4:\"CODE\";N;s:4:\"NAME\";s:7:\"AILERON\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(351, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:92;s:4:\"CODE\";N;s:4:\"NAME\";s:117:\"Коврики а/м AILERON 61501 RENAULT LOGAN 06--14 полиуретан черн. с борт. компл. 4шт\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(352, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:38;s:4:\"CODE\";N;s:4:\"NAME\";s:7:\"CARMATE\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(353, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:93;s:4:\"CODE\";N;s:4:\"NAME\";s:188:\"Освежитель кондиционера CARMATE D38RU с бактериц. эффектом. Устраняет неприятн. запахи. С ионами серебра. 40мл\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(354, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:94;s:4:\"CODE\";N;s:4:\"NAME\";s:142:\"Коврики а/м NORPLAST NPLPO5948 MMC PAJERO IV  07--&gt; полиуретан черн. с борт. компл. 4 шт. с крепл.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(355, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:39;s:4:\"CODE\";N;s:4:\"NAME\";s:3:\"SIM\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(356, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:95;s:4:\"CODE\";N;s:4:\"NAME\";s:101:\"Дефлектор SIM SVOTIG0832 окон VW TIGUAN 08--&gt; клеящ. компл. 4шт темн.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(357, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:96;s:4:\"CODE\";N;s:4:\"NAME\";s:137:\"Коврики а/м NORPLAST NPLPO0706 BMW X5 E70 07--13/X6 E71; E72 08--&gt; полиуретан черн. с борт. с крепл.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(358, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:41;s:4:\"CODE\";N;s:4:\"NAME\";s:12:\"РОССИЯ\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(359, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:97;s:4:\"CODE\";N;s:4:\"NAME\";s:122:\"Знак аварийной остановки РОССИЯ 25724 металл. ДИАЛУЧ соотв. ГОСТ (108104)\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(360, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:42;s:4:\"CODE\";N;s:4:\"NAME\";s:10:\"ЗЕБРА\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(361, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:98;s:4:\"CODE\";N;s:4:\"NAME\";s:71:\"Изолента ЗЕБРА 6320 19мм х 25м черная Китай\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(362, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:43;s:4:\"CODE\";N;s:4:\"NAME\";s:12:\"ДиаЛУЧ\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(363, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:99;s:4:\"CODE\";N;s:4:\"NAME\";s:103:\"Перчатки рабочие ДиаЛУЧ 25643 а/м белые с ПВХ высш.сорт (2шт)\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(364, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:100;s:4:\"CODE\";N;s:4:\"NAME\";s:144:\"Коврики а/м NORPLAST NPLPO9550 VW TIGUAN 08--&gt; 11--&gt; полиуретан черн. с борт. компл. 4шт с крепл.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(365, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:101;s:4:\"CODE\";N;s:4:\"NAME\";s:140:\"Коврики а/м NORPLAST NPLPO6310 OPEL ASTRA J 2010--&gt; полиуретан черн. с борт. компл. 4шт с крепл.\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(366, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:102;s:4:\"CODE\";N;s:4:\"NAME\";s:123:\"Коврики а/м NORPLAST NPLPO6171 NISSAN TEANA 2008--13 полиуретан черн. с борт. компл. 4шт\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(367, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_data_import.php?lang=ru', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:3;s:4:\"CODE\";N;s:4:\"NAME\";s:0:\"\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(368, NULL, 'UNKNOWN', 'IBLOCK_ELEMENT_DELETE', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_element_admin.php?ID=3&action_button=delete&lang=ru&&type=catalog&lang=ru&IBLOCK_ID=1&find_section_section=-1&mode=list&table_id=tbl_iblock_element_160552fecab66c961b2b218b964e1a9a', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:3;s:4:\"CODE\";N;s:4:\"NAME\";s:0:\"\";s:12:\"ELEMENT_NAME\";s:10:\"Товар\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(369, NULL, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:17:\"katalog/index.php\";}'),
(370, NULL, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:17:\"katalog/index.php\";}'),
(371, NULL, 'UNKNOWN', 'IBLOCK_SECTION_DELETE', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_admin.php?mode=frame&PAGEN_1=1&SHOWALL_1=0&SIZEN_1=50&IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0&by=id&order=asc&table_id=tbl_iblock_section_160552fecab66c961b2b218b964e1a9a', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:40;s:4:\"CODE\";N;s:4:\"NAME\";s:0:\"\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(372, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:19;s:4:\"CODE\";s:5:\"gates\";s:4:\"NAME\";s:5:\"GATES\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/catalog/index.php?ID=1\";}'),
(373, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:20;s:4:\"CODE\";s:3:\"mmc\";s:4:\"NAME\";s:3:\"MMC\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/katalog/index.php?ID=1\";}'),
(374, NULL, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/public_file_edit_src.php?bxsender=core_window_cdialog&lang=ru&site=ru&back_url=%2Fkatalog%2F%3Fclear_cache%3DY&path=%2Fbitrix%2Ftemplates%2Favtomir%2Fcomponents%2Fbitrix%2Fcatalog.section.list%2Fsection%2Ftemplate.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:84:\"bitrix/templates/avtomir/components/bitrix/catalog.section.list/section/template.php\";}'),
(375, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:21;s:4:\"CODE\";s:6:\"toyota\";s:4:\"NAME\";s:6:\"TOYOTA\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/katalog/index.php?ID=1\";}'),
(376, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:22;s:4:\"CODE\";s:6:\"vernet\";s:4:\"NAME\";s:6:\"VERNET\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/katalog/index.php?ID=1\";}'),
(377, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:23;s:4:\"CODE\";s:4:\"depo\";s:4:\"NAME\";s:4:\"DEPO\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/katalog/index.php?ID=1\";}'),
(378, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:24;s:4:\"CODE\";s:6:\"nissan\";s:4:\"NAME\";s:6:\"NISSAN\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/katalog/index.php?ID=1\";}'),
(379, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:25;s:4:\"CODE\";s:4:\"ocap\";s:4:\"NAME\";s:4:\"OCAP\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/katalog/index.php?ID=1\";}'),
(380, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:25;s:4:\"CODE\";s:4:\"ocap\";s:4:\"NAME\";s:4:\"OCAP\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/katalog/index.php?ID=1\";}'),
(381, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:26;s:4:\"CODE\";s:4:\"opel\";s:4:\"NAME\";s:4:\"OPEL\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/katalog/index.php?ID=1\";}'),
(382, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:27;s:4:\"CODE\";s:4:\"fram\";s:4:\"NAME\";s:4:\"FRAM\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/katalog/index.php?ID=1\";}'),
(383, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:28;s:4:\"CODE\";s:5:\"bosch\";s:4:\"NAME\";s:5:\"BOSCH\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/katalog/index.php?ID=1\";}'),
(384, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:29;s:4:\"CODE\";s:4:\"febi\";s:4:\"NAME\";s:4:\"FEBI\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/katalog/index.php?ID=1\";}'),
(385, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:30;s:4:\"CODE\";s:9:\"mtf-light\";s:4:\"NAME\";s:9:\"MTF Light\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/katalog/index.php?ID=1\";}'),
(386, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:31;s:4:\"CODE\";s:8:\"norplast\";s:4:\"NAME\";s:8:\"NORPLAST\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/katalog/index.php?ID=1\";}'),
(387, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:32;s:4:\"CODE\";s:3:\"svs\";s:4:\"NAME\";s:3:\"SVS\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/katalog/index.php?ID=1\";}'),
(388, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:33;s:4:\"CODE\";s:6:\"alfeco\";s:4:\"NAME\";s:6:\"ALFECO\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/katalog/index.php?ID=1\";}'),
(389, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:34;s:4:\"CODE\";s:4:\"slim\";s:4:\"NAME\";s:4:\"SLIM\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/katalog/index.php?ID=1\";}'),
(390, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:34;s:4:\"CODE\";s:4:\"slim\";s:4:\"NAME\";s:4:\"SLIM\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/katalog/index.php?ID=1\";}'),
(391, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:35;s:4:\"CODE\";s:11:\"air-couture\";s:4:\"NAME\";s:11:\"AIR COUTURE\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/katalog/index.php?ID=1\";}'),
(392, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:35;s:4:\"CODE\";s:11:\"air-couture\";s:4:\"NAME\";s:11:\"AIR COUTURE\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/katalog/index.php?ID=1\";}'),
(393, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:36;s:4:\"CODE\";s:7:\"airline\";s:4:\"NAME\";s:7:\"AIRLINE\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/katalog/index.php?ID=1\";}'),
(394, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:37;s:4:\"CODE\";s:7:\"aileron\";s:4:\"NAME\";s:7:\"AILERON\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/katalog/index.php?ID=1\";}'),
(395, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:38;s:4:\"CODE\";s:7:\"carmate\";s:4:\"NAME\";s:7:\"CARMATE\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/katalog/index.php?ID=1\";}'),
(396, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:39;s:4:\"CODE\";s:3:\"sim\";s:4:\"NAME\";s:3:\"SIM\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/katalog/index.php?ID=1\";}'),
(397, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:38;s:4:\"CODE\";s:7:\"carmate\";s:4:\"NAME\";s:7:\"CARMATE\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/katalog/index.php?ID=1\";}'),
(398, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:39;s:4:\"CODE\";s:3:\"sim\";s:4:\"NAME\";s:3:\"SIM\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/katalog/index.php?ID=1\";}'),
(399, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:39;s:4:\"CODE\";s:3:\"sim\";s:4:\"NAME\";s:3:\"SIM\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/katalog/index.php?ID=1\";}'),
(400, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:41;s:4:\"CODE\";s:7:\"rossiya\";s:4:\"NAME\";s:12:\"РОССИЯ\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/katalog/index.php?ID=1\";}'),
(401, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:42;s:4:\"CODE\";s:5:\"zebra\";s:4:\"NAME\";s:10:\"ЗЕБРА\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/katalog/index.php?ID=1\";}'),
(402, NULL, 'UNKNOWN', 'IBLOCK_SECTION_EDIT', 'iblock', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=1&type=catalog&lang=ru&find_section_section=0', NULL, 1, NULL, 'a:6:{s:2:\"ID\";i:43;s:4:\"CODE\";s:7:\"dialuch\";s:4:\"NAME\";s:12:\"ДиаЛУЧ\";s:12:\"SECTION_NAME\";s:26:\"Производитель\";s:7:\"USER_ID\";i:1;s:15:\"IBLOCK_PAGE_URL\";s:23:\"/katalog/index.php?ID=1\";}'),
(403, NULL, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:17:\"katalog/index.php\";}'),
(404, NULL, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/public_file_edit_src.php?bxsender=core_window_cdialog&lang=ru&site=ru&back_url=%2Fkatalog%2F%3Fclear_cache%3DY&path=%2Fbitrix%2Ftemplates%2Favtomir%2Fcomponents%2Fbitrix%2Fcatalog.search%2Fsearch%2Ftemplate.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:77:\"bitrix/templates/avtomir/components/bitrix/catalog.search/search/template.php\";}'),
(405, NULL, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:17:\"katalog/tovar.php\";}'),
(406, NULL, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:17:\"katalog/index.php\";}'),
(407, NULL, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/public_file_edit_src.php?bxsender=core_window_cdialog&lang=ru&site=ru&back_url=%2Fkatalog%2F%3Fclear_cache%3DY&path=%2Fbitrix%2Ftemplates%2Favtomir%2Fcomponents%2Fbitrix%2Fcatalog%2Fcatalog%2Fsections.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:71:\"bitrix/templates/avtomir/components/bitrix/catalog/catalog/sections.php\";}'),
(408, NULL, 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=avtomir&newFolder=Y&path=%2F&back_url=%2F&siteTemplateId=avtomir', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:14:\"news/index.php\";}'),
(409, NULL, 'UNKNOWN', 'SECTION_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=avtomir&newFolder=Y&path=%2F&back_url=%2F&siteTemplateId=avtomir', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:4:\"news\";}'),
(410, NULL, 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=avtomir&newFolder=Y&path=%2F&back_url=%2F&siteTemplateId=avtomir', NULL, 1, NULL, 'a:2:{s:4:\"path\";b:0;s:9:\"menu_name\";N;}'),
(411, NULL, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:14:\"news/index.php\";}'),
(412, NULL, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:14:\"news/index.php\";}'),
(413, NULL, 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=avtomir&newFolder=Y&path=%2F&back_url=%2F&siteTemplateId=avtomir', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:18:\"kontakty/index.php\";}'),
(414, NULL, 'UNKNOWN', 'SECTION_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=avtomir&newFolder=Y&path=%2F&back_url=%2F&siteTemplateId=avtomir', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:8:\"kontakty\";}'),
(415, NULL, 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=avtomir&newFolder=Y&path=%2F&back_url=%2F&siteTemplateId=avtomir', NULL, 1, NULL, 'a:2:{s:4:\"path\";b:0;s:9:\"menu_name\";N;}'),
(416, NULL, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:18:\"kontakty/index.php\";}'),
(417, NULL, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:18:\"kontakty/index.php\";}'),
(418, NULL, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/public_file_edit_src.php?bxsender=core_window_cdialog&lang=ru&site=ru&back_url=%2Fkontakty%2F%3Fclear_cache%3DY&path=%2Fbitrix%2Ftemplates%2Favtomir%2Fcomponents%2Fbitrix%2Fbreadcrumb%2Fbreadcrumb%2Ftemplate.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:77:\"bitrix/templates/avtomir/components/bitrix/breadcrumb/breadcrumb/template.php\";}'),
(419, NULL, 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=avtomir&newFolder=Y&path=%2F&back_url=%2F&siteTemplateId=avtomir', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:18:\"dostavka/index.php\";}');
INSERT INTO `b_event_log` (`ID`, `TIMESTAMP_X`, `SEVERITY`, `AUDIT_TYPE_ID`, `MODULE_ID`, `ITEM_ID`, `REMOTE_ADDR`, `USER_AGENT`, `REQUEST_URI`, `SITE_ID`, `USER_ID`, `GUEST_ID`, `DESCRIPTION`) VALUES
(420, NULL, 'UNKNOWN', 'SECTION_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=avtomir&newFolder=Y&path=%2F&back_url=%2F&siteTemplateId=avtomir', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:8:\"dostavka\";}'),
(421, NULL, 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=avtomir&newFolder=Y&path=%2F&back_url=%2F&siteTemplateId=avtomir', NULL, 1, NULL, 'a:2:{s:4:\"path\";b:0;s:9:\"menu_name\";N;}'),
(422, NULL, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:18:\"dostavka/index.php\";}'),
(423, NULL, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:9:\"index.php\";}'),
(424, NULL, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/public_file_edit_src.php?bxsender=core_window_cdialog&lang=ru&site=ru&back_url=%2F%3Fclear_cache%3DY&path=%2Fbitrix%2Ftemplates%2Favtomir%2Fcomponents%2Fbitrix%2Fmenu%2Fmenu_header%2Ftemplate.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:72:\"bitrix/templates/avtomir/components/bitrix/menu/menu_header/template.php\";}'),
(425, NULL, 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=avtomir&newFolder=Y&path=%2F&back_url=%2F&siteTemplateId=avtomir', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:13:\"vin/index.php\";}'),
(426, NULL, 'UNKNOWN', 'SECTION_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=avtomir&newFolder=Y&path=%2F&back_url=%2F&siteTemplateId=avtomir', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:3:\"vin\";}'),
(427, NULL, 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=avtomir&newFolder=Y&path=%2F&back_url=%2F&siteTemplateId=avtomir', NULL, 1, NULL, 'a:2:{s:4:\"path\";b:0;s:9:\"menu_name\";N;}'),
(428, NULL, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:13:\"vin/index.php\";}');

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_message`
--

CREATE TABLE `b_event_message` (
  `ID` int(18) NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EMAIL_FROM` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_FROM#',
  `EMAIL_TO` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_TO#',
  `SUBJECT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` longtext COLLATE utf8_unicode_ci,
  `MESSAGE_PHP` longtext COLLATE utf8_unicode_ci,
  `BODY_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `BCC` text COLLATE utf8_unicode_ci,
  `REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CC` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRIORITY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_TEMPLATE_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADDITIONAL_FIELD` text COLLATE utf8_unicode_ci,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_event_message`
--

INSERT INTO `b_event_message` (`ID`, `TIMESTAMP_X`, `EVENT_NAME`, `LID`, `ACTIVE`, `EMAIL_FROM`, `EMAIL_TO`, `SUBJECT`, `MESSAGE`, `MESSAGE_PHP`, `BODY_TYPE`, `BCC`, `REPLY_TO`, `CC`, `IN_REPLY_TO`, `PRIORITY`, `FIELD1_NAME`, `FIELD1_VALUE`, `FIELD2_NAME`, `FIELD2_VALUE`, `SITE_TEMPLATE_ID`, `ADDITIONAL_FIELD`, `LANGUAGE_ID`) VALUES
(1, '2017-08-16 14:16:29', 'NEW_USER', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#DEFAULT_EMAIL_FROM#', '#SITE_NAME#: Зарегистрировался новый пользователь', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНа сайте #SERVER_NAME# успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: #USER_ID#\n\nИмя: #NAME#\nФамилия: #LAST_NAME#\nE-Mail: #EMAIL#\n\nLogin: #LOGIN#\n\nПисьмо сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНа сайте <?=$arParams[\"SERVER_NAME\"];?> успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\n\nИмя: <?=$arParams[\"NAME\"];?>\n\nФамилия: <?=$arParams[\"LAST_NAME\"];?>\n\nE-Mail: <?=$arParams[\"EMAIL\"];?>\n\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nПисьмо сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(2, '2017-08-16 14:16:29', 'USER_INFO', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Регистрационная информация', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(3, '2017-08-16 14:16:29', 'USER_PASS_REQUEST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Запрос на смену пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(4, '2017-08-16 14:16:29', 'USER_PASS_CHANGED', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение смены пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(5, '2017-08-16 14:16:29', 'NEW_USER_CONFIRM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение регистрации нового пользователя', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере #SERVER_NAME#.\n\nВаш код для подтверждения регистрации: #CONFIRM_CODE#\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#&confirm_code=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере <?=$arParams[\"SERVER_NAME\"];?>.\n\nВаш код для подтверждения регистрации: <?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>&confirm_code=<?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>\n\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(6, '2017-08-16 14:16:29', 'USER_INVITE', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Приглашение на сайт', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\nЗдравствуйте, #NAME# #LAST_NAME#!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: #ID#\nLogin: #LOGIN#\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth.php?change_password=yes&USER_LOGIN=#URL_LOGIN#&USER_CHECKWORD=#CHECKWORD#\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\nЗдравствуйте, <?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"ID\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth.php?change_password=yes&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>\n\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(7, '2017-08-16 14:16:29', 'FEEDBACK_FORM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: Сообщение из формы обратной связи', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: #AUTHOR#\nE-mail автора: #AUTHOR_EMAIL#\n\nТекст сообщения:\n#TEXT#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nE-mail автора: <?=$arParams[\"AUTHOR_EMAIL\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"TEXT\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru');

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_message_attachment`
--

CREATE TABLE `b_event_message_attachment` (
  `EVENT_MESSAGE_ID` int(18) NOT NULL,
  `FILE_ID` int(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_message_site`
--

CREATE TABLE `b_event_message_site` (
  `EVENT_MESSAGE_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_event_message_site`
--

INSERT INTO `b_event_message_site` (`EVENT_MESSAGE_ID`, `SITE_ID`) VALUES
(1, 's1'),
(2, 's1'),
(3, 's1'),
(4, 's1'),
(5, 's1'),
(6, 's1'),
(7, 's1');

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_type`
--

CREATE TABLE `b_event_type` (
  `ID` int(18) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `SORT` int(18) NOT NULL DEFAULT '150'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_event_type`
--

INSERT INTO `b_event_type` (`ID`, `LID`, `EVENT_NAME`, `NAME`, `DESCRIPTION`, `SORT`) VALUES
(1, 'ru', 'NEW_USER', 'Зарегистрировался новый пользователь', '\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n', 1),
(2, 'ru', 'USER_INFO', 'Информация о пользователе', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 2),
(3, 'ru', 'NEW_USER_CONFIRM', 'Подтверждение регистрации нового пользователя', '\n\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n#CONFIRM_CODE# - Код подтверждения\n', 3),
(4, 'ru', 'USER_PASS_REQUEST', 'Запрос на смену пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 4),
(5, 'ru', 'USER_PASS_CHANGED', 'Подтверждение смены пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 5),
(6, 'ru', 'USER_INVITE', 'Приглашение на сайт нового пользователя', '#ID# - ID пользователя\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#PASSWORD# - пароль пользователя \n#CHECKWORD# - Контрольная строка для смены пароля\n#XML_ID# - ID пользователя для связи с внешними источниками\n', 6),
(7, 'ru', 'FEEDBACK_FORM', 'Отправка сообщения через форму обратной связи', '#AUTHOR# - Автор сообщения\n#AUTHOR_EMAIL# - Email автора сообщения\n#TEXT# - Текст сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 7),
(8, 'en', 'NEW_USER', 'New user was registered', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#USER_IP# - User IP\n#USER_HOST# - User Host\n', 1),
(9, 'en', 'USER_INFO', 'Account Information', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 2),
(10, 'en', 'NEW_USER_CONFIRM', 'New user registration confirmation', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - E-mail\n#NAME# - First name\n#LAST_NAME# - Last name\n#USER_IP# - User IP\n#USER_HOST# - User host\n#CONFIRM_CODE# - Confirmation code\n', 3),
(11, 'en', 'USER_PASS_REQUEST', 'Password Change Request', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 4),
(12, 'en', 'USER_PASS_CHANGED', 'Password Change Confirmation', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 5),
(13, 'en', 'USER_INVITE', 'Invitation of a new site user', '#ID# - User ID\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#PASSWORD# - User password \n#CHECKWORD# - Password check string\n#XML_ID# - User ID to link with external data sources\n\n', 6),
(14, 'en', 'FEEDBACK_FORM', 'Sending a message using a feedback form', '#AUTHOR# - Message author\n#AUTHOR_EMAIL# - Author\'s e-mail address\n#TEXT# - Message text\n#EMAIL_FROM# - Sender\'s e-mail address\n#EMAIL_TO# - Recipient\'s e-mail address', 7);

-- --------------------------------------------------------

--
-- Структура таблицы `b_favorite`
--

CREATE TABLE `b_favorite` (
  `ID` int(18) NOT NULL,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  `COMMENTS` text COLLATE utf8_unicode_ci,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `CODE_ID` int(18) DEFAULT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `MENU_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_file`
--

CREATE TABLE `b_file` (
  `ID` int(18) NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HEIGHT` int(18) DEFAULT NULL,
  `WIDTH` int(18) DEFAULT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `CONTENT_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'IMAGE',
  `SUBDIR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ORIGINAL_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HANDLER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_file_search`
--

CREATE TABLE `b_file_search` (
  `ID` int(11) NOT NULL,
  `SESS_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `F_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `B_DIR` int(11) NOT NULL DEFAULT '0',
  `F_SIZE` int(11) NOT NULL DEFAULT '0',
  `F_TIME` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_filters`
--

CREATE TABLE `b_filters` (
  `ID` int(18) NOT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `FILTER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FIELDS` text COLLATE utf8_unicode_ci NOT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESET` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESET_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) DEFAULT NULL,
  `SORT_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_finder_dest`
--

CREATE TABLE `b_finder_dest` (
  `USER_ID` int(11) NOT NULL,
  `CODE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_USER_ID` int(11) DEFAULT NULL,
  `CODE_TYPE` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTEXT` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_USE_DATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_geoip_handlers`
--

CREATE TABLE `b_geoip_handlers` (
  `ID` int(11) NOT NULL,
  `SORT` int(10) NOT NULL DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `CLASS_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_geoip_handlers`
--

INSERT INTO `b_geoip_handlers` (`ID`, `SORT`, `ACTIVE`, `CLASS_NAME`, `CONFIG`) VALUES
(1, 100, 'N', '\\Bitrix\\Main\\Service\\GeoIp\\MaxMind', NULL),
(2, 110, 'Y', '\\Bitrix\\Main\\Service\\GeoIp\\SypexGeo', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_group`
--

CREATE TABLE `b_group` (
  `ID` int(18) NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `ANONYMOUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECURITY_POLICY` text COLLATE utf8_unicode_ci,
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_group`
--

INSERT INTO `b_group` (`ID`, `TIMESTAMP_X`, `ACTIVE`, `C_SORT`, `ANONYMOUS`, `NAME`, `DESCRIPTION`, `SECURITY_POLICY`, `STRING_ID`) VALUES
(1, NULL, 'Y', 1, 'N', 'Администраторы', 'Полный доступ к управлению сайтом.', NULL, NULL),
(2, NULL, 'Y', 2, 'Y', 'Все пользователи (в том числе неавторизованные)', 'Все пользователи, включая неавторизованных.', NULL, NULL),
(3, NULL, 'Y', 3, 'N', 'Пользователи, имеющие право голосовать за рейтинг', 'В эту группу пользователи добавляются автоматически.', NULL, 'RATING_VOTE'),
(4, NULL, 'Y', 4, 'N', 'Пользователи имеющие право голосовать за авторитет', 'В эту группу пользователи добавляются автоматически.', NULL, 'RATING_VOTE_AUTHORITY');

-- --------------------------------------------------------

--
-- Структура таблицы `b_group_collection_task`
--

CREATE TABLE `b_group_collection_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `COLLECTION_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_group_subordinate`
--

CREATE TABLE `b_group_subordinate` (
  `ID` int(18) NOT NULL,
  `AR_SUBGROUP_ID` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_group_task`
--

CREATE TABLE `b_group_task` (
  `GROUP_ID` int(18) NOT NULL,
  `TASK_ID` int(18) NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_hlblock_entity`
--

CREATE TABLE `b_hlblock_entity` (
  `ID` int(11) UNSIGNED NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `TABLE_NAME` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_hlblock_entity_lang`
--

CREATE TABLE `b_hlblock_entity_lang` (
  `ID` int(11) UNSIGNED NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_hlblock_entity_rights`
--

CREATE TABLE `b_hlblock_entity_rights` (
  `ID` int(11) UNSIGNED NOT NULL,
  `HL_ID` int(11) UNSIGNED NOT NULL,
  `TASK_ID` int(11) UNSIGNED NOT NULL,
  `ACCESS_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_hot_keys`
--

CREATE TABLE `b_hot_keys` (
  `ID` int(18) NOT NULL,
  `KEYS_STRING` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_ID` int(18) NOT NULL,
  `USER_ID` int(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_hot_keys`
--

INSERT INTO `b_hot_keys` (`ID`, `KEYS_STRING`, `CODE_ID`, `USER_ID`) VALUES
(1, 'Ctrl+Alt+85', 139, 0),
(2, 'Ctrl+Alt+80', 17, 0),
(3, 'Ctrl+Alt+70', 120, 0),
(4, 'Ctrl+Alt+68', 117, 0),
(5, 'Ctrl+Alt+81', 3, 0),
(6, 'Ctrl+Alt+75', 106, 0),
(7, 'Ctrl+Alt+79', 133, 0),
(8, 'Ctrl+Alt+70', 121, 0),
(9, 'Ctrl+Alt+69', 118, 0),
(10, 'Ctrl+Shift+83', 87, 0),
(11, 'Ctrl+Shift+88', 88, 0),
(12, 'Ctrl+Shift+76', 89, 0),
(13, 'Ctrl+Alt+85', 139, 1),
(14, 'Ctrl+Alt+80', 17, 1),
(15, 'Ctrl+Alt+70', 120, 1),
(16, 'Ctrl+Alt+68', 117, 1),
(17, 'Ctrl+Alt+81', 3, 1),
(18, 'Ctrl+Alt+75', 106, 1),
(19, 'Ctrl+Alt+79', 133, 1),
(20, 'Ctrl+Alt+70', 121, 1),
(21, 'Ctrl+Alt+69', 118, 1),
(22, 'Ctrl+Shift+83', 87, 1),
(23, 'Ctrl+Shift+88', 88, 1),
(24, 'Ctrl+Shift+76', 89, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `b_hot_keys_code`
--

CREATE TABLE `b_hot_keys_code` (
  `ID` int(18) NOT NULL,
  `CLASS_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE_OBJ` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_CUSTOM` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_hot_keys_code`
--

INSERT INTO `b_hot_keys_code` (`ID`, `CLASS_NAME`, `CODE`, `NAME`, `COMMENTS`, `TITLE_OBJ`, `URL`, `IS_CUSTOM`) VALUES
(3, 'CAdminTabControl', 'NextTab();', 'HK_DB_CADMINTC', 'HK_DB_CADMINTC_C', 'tab-container', '', 0),
(5, 'btn_new', 'var d=BX (\'btn_new\'); if (d) location.href = d.href;', 'HK_DB_BUT_ADD', 'HK_DB_BUT_ADD_C', 'btn_new', '', 0),
(6, 'btn_excel', 'var d=BX(\'btn_excel\'); if (d) location.href = d.href;', 'HK_DB_BUT_EXL', 'HK_DB_BUT_EXL_C', 'btn_excel', '', 0),
(7, 'btn_settings', 'var d=BX(\'btn_settings\'); if (d) location.href = d.href;', 'HK_DB_BUT_OPT', 'HK_DB_BUT_OPT_C', 'btn_settings', '', 0),
(8, 'btn_list', 'var d=BX(\'btn_list\'); if (d) location.href = d.href;', 'HK_DB_BUT_LST', 'HK_DB_BUT_LST_C', 'btn_list', '', 0),
(9, 'Edit_Save_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'save\'}}, true );  if (d) d.click();', 'HK_DB_BUT_SAVE', 'HK_DB_BUT_SAVE_C', 'Edit_Save_Button', '', 0),
(10, 'btn_delete', 'var d=BX(\'btn_delete\'); if (d) location.href = d.href;', 'HK_DB_BUT_DEL', 'HK_DB_BUT_DEL_C', 'btn_delete', '', 0),
(12, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'find\'}}, true ); if (d) d.focus();', 'HK_DB_FLT_FND', 'HK_DB_FLT_FND_C', 'find', '', 0),
(13, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'set_filter\'}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_F', 'HK_DB_FLT_BUT_F_C', 'set_filter', '', 0),
(14, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'del_filter\'}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_CNL', 'HK_DB_FLT_BUT_CNL_C', 'del_filter', '', 0),
(15, 'bx-panel-admin-button-help-icon-id', 'var d=BX(\'bx-panel-admin-button-help-icon-id\'); if (d) location.href = d.href;', 'HK_DB_BUT_HLP', 'HK_DB_BUT_HLP_C', 'bx-panel-admin-button-help-icon-id', '', 0),
(17, 'Global', 'BXHotKeys.ShowSettings();', 'HK_DB_SHW_L', 'HK_DB_SHW_L_C', 'bx-panel-hotkeys', '', 0),
(19, 'Edit_Apply_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'apply\'}}, true );  if (d) d.click();', 'HK_DB_BUT_APPL', 'HK_DB_BUT_APPL_C', 'Edit_Apply_Button', '', 0),
(20, 'Edit_Cancel_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'cancel\'}}, true );  if (d) d.click();', 'HK_DB_BUT_CANCEL', 'HK_DB_BUT_CANCEL_C', 'Edit_Cancel_Button', '', 0),
(54, 'top_panel_org_fav', '', '-=AUTONAME=-', NULL, 'top_panel_org_fav', NULL, 0),
(55, 'top_panel_module_settings', '', '-=AUTONAME=-', NULL, 'top_panel_module_settings', '', 0),
(56, 'top_panel_interface_settings', '', '-=AUTONAME=-', NULL, 'top_panel_interface_settings', '', 0),
(57, 'top_panel_help', '', '-=AUTONAME=-', NULL, 'top_panel_help', '', 0),
(58, 'top_panel_bizproc_tasks', '', '-=AUTONAME=-', NULL, 'top_panel_bizproc_tasks', '', 0),
(59, 'top_panel_add_fav', '', '-=AUTONAME=-', NULL, 'top_panel_add_fav', NULL, 0),
(60, 'top_panel_create_page', '', '-=AUTONAME=-', NULL, 'top_panel_create_page', '', 0),
(62, 'top_panel_create_folder', '', '-=AUTONAME=-', NULL, 'top_panel_create_folder', '', 0),
(63, 'top_panel_edit_page', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page', '', 0),
(64, 'top_panel_page_prop', '', '-=AUTONAME=-', NULL, 'top_panel_page_prop', '', 0),
(65, 'top_panel_edit_page_html', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page_html', '', 0),
(67, 'top_panel_edit_page_php', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page_php', '', 0),
(68, 'top_panel_del_page', '', '-=AUTONAME=-', NULL, 'top_panel_del_page', '', 0),
(69, 'top_panel_folder_prop', '', '-=AUTONAME=-', NULL, 'top_panel_folder_prop', '', 0),
(70, 'top_panel_access_folder_new', '', '-=AUTONAME=-', NULL, 'top_panel_access_folder_new', '', 0),
(71, 'main_top_panel_struct_panel', '', '-=AUTONAME=-', NULL, 'main_top_panel_struct_panel', '', 0),
(72, 'top_panel_cache_page', '', '-=AUTONAME=-', NULL, 'top_panel_cache_page', '', 0),
(73, 'top_panel_cache_comp', '', '-=AUTONAME=-', NULL, 'top_panel_cache_comp', '', 0),
(74, 'top_panel_cache_not', '', '-=AUTONAME=-', NULL, 'top_panel_cache_not', '', 0),
(75, 'top_panel_edit_mode', '', '-=AUTONAME=-', NULL, 'top_panel_edit_mode', '', 0),
(76, 'top_panel_templ_site_css', '', '-=AUTONAME=-', NULL, 'top_panel_templ_site_css', '', 0),
(77, 'top_panel_templ_templ_css', '', '-=AUTONAME=-', NULL, 'top_panel_templ_templ_css', '', 0),
(78, 'top_panel_templ_site', '', '-=AUTONAME=-', NULL, 'top_panel_templ_site', '', 0),
(81, 'top_panel_debug_time', '', '-=AUTONAME=-', NULL, 'top_panel_debug_time', '', 0),
(82, 'top_panel_debug_incl', '', '-=AUTONAME=-', NULL, 'top_panel_debug_incl', '', 0),
(83, 'top_panel_debug_sql', '', '-=AUTONAME=-', NULL, 'top_panel_debug_sql', NULL, 0),
(84, 'top_panel_debug_compr', '', '-=AUTONAME=-', NULL, 'top_panel_debug_compr', '', 0),
(85, 'MTP_SHORT_URI1', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI1', '', 0),
(86, 'MTP_SHORT_URI_LIST', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI_LIST', '', 0),
(87, 'FMST_PANEL_STICKER_ADD', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKER_ADD', '', 0),
(88, 'FMST_PANEL_STICKERS_SHOW', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKERS_SHOW', '', 0),
(89, 'FMST_PANEL_CUR_STICKER_LIST', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_CUR_STICKER_LIST', '', 0),
(90, 'FMST_PANEL_ALL_STICKER_LIST', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_ALL_STICKER_LIST', '', 0),
(91, 'top_panel_menu', 'var d=BX(\"bx-panel-menu\"); if (d) d.click();', '-=AUTONAME=-', NULL, 'bx-panel-menu', '', 0),
(92, 'top_panel_admin', 'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-admin-tab', '', 0),
(93, 'admin_panel_site', 'var d=BX(\'bx-panel-view-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-view-tab', '', 0),
(94, 'admin_panel_admin', 'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-admin-tab', '', 0),
(96, 'top_panel_folder_prop_new', '', '-=AUTONAME=-', NULL, 'top_panel_folder_prop_new', '', 0),
(97, 'main_top_panel_structure', '', '-=AUTONAME=-', NULL, 'main_top_panel_structure', '', 0),
(98, 'top_panel_clear_cache', '', '-=AUTONAME=-', NULL, 'top_panel_clear_cache', '', 0),
(99, 'top_panel_templ', '', '-=AUTONAME=-', NULL, 'top_panel_templ', '', 0),
(100, 'top_panel_debug', '', '-=AUTONAME=-', NULL, 'top_panel_debug', '', 0),
(101, 'MTP_SHORT_URI', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI', '', 0),
(102, 'FMST_PANEL_STICKERS', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKERS', '', 0),
(103, 'top_panel_settings', '', '-=AUTONAME=-', NULL, 'top_panel_settings', '', 0),
(104, 'top_panel_fav', '', '-=AUTONAME=-', NULL, 'top_panel_fav', '', 0),
(106, 'Global', 'location.href=\'/bitrix/admin/hot_keys_list.php?lang=ru\';', 'HK_DB_SHW_HK', '', '', '', 0),
(107, 'top_panel_edit_new', '', '-=AUTONAME=-', NULL, 'top_panel_edit_new', '', 0),
(108, 'FLOW_PANEL_CREATE_WITH_WF', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_CREATE_WITH_WF', '', 0),
(109, 'FLOW_PANEL_EDIT_WITH_WF', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_EDIT_WITH_WF', '', 0),
(110, 'FLOW_PANEL_HISTORY', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_HISTORY', '', 0),
(111, 'top_panel_create_new', '', '-=AUTONAME=-', NULL, 'top_panel_create_new', '', 0),
(112, 'top_panel_create_folder_new', '', '-=AUTONAME=-', NULL, 'top_panel_create_folder_new', '', 0),
(116, 'bx-panel-toggle', '', '-=AUTONAME=-', NULL, 'bx-panel-toggle', '', 0),
(117, 'bx-panel-small-toggle', '', '-=AUTONAME=-', NULL, 'bx-panel-small-toggle', '', 0),
(118, 'bx-panel-expander', 'var d=BX(\'bx-panel-expander\'); if (d) BX.fireEvent(d, \'click\');', '-=AUTONAME=-', NULL, 'bx-panel-expander', '', 0),
(119, 'bx-panel-hider', 'var d=BX(\'bx-panel-hider\'); if (d) d.click();', '-=AUTONAME=-', NULL, 'bx-panel-hider', '', 0),
(120, 'search-textbox-input', 'var d=BX(\'search-textbox-input\'); if (d) { d.click(); d.focus();}', '-=AUTONAME=-', '', 'search', '', 0),
(121, 'bx-search-input', 'var d=BX(\'bx-search-input\'); if (d) { d.click(); d.focus(); }', '-=AUTONAME=-', '', 'bx-search-input', '', 0),
(133, 'bx-panel-logout', 'var d=BX(\'bx-panel-logout\'); if (d) location.href = d.href;', '-=AUTONAME=-', '', 'bx-panel-logout', '', 0),
(135, 'CDialog', 'var d=BX(\'cancel\'); if (d) d.click();', 'HK_DB_D_CANCEL', '', 'cancel', '', 0),
(136, 'CDialog', 'var d=BX(\'close\'); if (d) d.click();', 'HK_DB_D_CLOSE', '', 'close', '', 0),
(137, 'CDialog', 'var d=BX(\'savebtn\'); if (d) d.click();', 'HK_DB_D_SAVE', '', 'savebtn', '', 0),
(138, 'CDialog', 'var d=BX(\'btn_popup_save\'); if (d) d.click();', 'HK_DB_D_EDIT_SAVE', '', 'btn_popup_save', '', 0),
(139, 'Global', 'location.href=\'/bitrix/admin/user_admin.php?lang=\'+phpVars.LANGUAGE_ID;', 'HK_DB_SHW_U', '', '', '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock`
--

CREATE TABLE `b_iblock` (
  `ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `LIST_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CANONICAL_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `RSS_TTL` int(11) NOT NULL DEFAULT '24',
  `RSS_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `RSS_FILE_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RSS_FILE_LIMIT` int(11) DEFAULT NULL,
  `RSS_FILE_DAYS` int(11) DEFAULT NULL,
  `RSS_YANDEX_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_ELEMENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `INDEX_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `WORKFLOW` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `BIZPROC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SECTION_CHOOSER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RIGHTS_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PROPERTY` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROPERTY_INDEX` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '1',
  `LAST_CONV_ELEMENT` int(11) NOT NULL DEFAULT '0',
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTIONS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENTS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock`
--

INSERT INTO `b_iblock` (`ID`, `TIMESTAMP_X`, `IBLOCK_TYPE_ID`, `LID`, `CODE`, `NAME`, `ACTIVE`, `SORT`, `LIST_PAGE_URL`, `DETAIL_PAGE_URL`, `SECTION_PAGE_URL`, `CANONICAL_PAGE_URL`, `PICTURE`, `DESCRIPTION`, `DESCRIPTION_TYPE`, `RSS_TTL`, `RSS_ACTIVE`, `RSS_FILE_ACTIVE`, `RSS_FILE_LIMIT`, `RSS_FILE_DAYS`, `RSS_YANDEX_ACTIVE`, `XML_ID`, `TMP_ID`, `INDEX_ELEMENT`, `INDEX_SECTION`, `WORKFLOW`, `BIZPROC`, `SECTION_CHOOSER`, `LIST_MODE`, `RIGHTS_MODE`, `SECTION_PROPERTY`, `PROPERTY_INDEX`, `VERSION`, `LAST_CONV_ELEMENT`, `SOCNET_GROUP_ID`, `EDIT_FILE_BEFORE`, `EDIT_FILE_AFTER`, `SECTIONS_NAME`, `SECTION_NAME`, `ELEMENTS_NAME`, `ELEMENT_NAME`) VALUES
(1, '2017-08-22 17:37:29', 'catalog', 's1', 'catalog', 'Каталог', 'Y', 500, '#SITE_DIR#/katalog/index.php?ID=#IBLOCK_ID#', '#SITE_DIR#/katalog/detail.php?ID=#ELEMENT_ID#', '#SITE_DIR#/katalog/list.php?SECTION_ID=#SECTION_ID#', '', NULL, '', 'text', 24, 'Y', 'N', NULL, NULL, 'N', NULL, '52c5b44a23d68d23e20b1944eacd3ba3', 'Y', 'Y', 'N', 'N', 'L', '', 'S', 'N', 'N', 1, 0, NULL, '', '', 'Производители', 'Производитель', 'Товары', 'Товар'),
(2, '2017-08-26 09:56:45', 'news', 's1', 'news', 'Новости', 'Y', 500, '#SITE_DIR#/news/index.php?ID=#IBLOCK_ID#', '#SITE_DIR#/news/detail.php?ID=#ELEMENT_ID#', '#SITE_DIR#/news/list.php?SECTION_ID=#SECTION_ID#', '', NULL, '', 'text', 24, 'Y', 'N', NULL, NULL, 'N', NULL, NULL, 'Y', 'Y', 'N', 'N', 'L', '', 'S', 'N', 'N', 1, 0, NULL, '', '', 'Разделы', 'Раздел', 'Элементы', 'Элемент');

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_cache`
--

CREATE TABLE `b_iblock_cache` (
  `CACHE_KEY` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `CACHE` longtext COLLATE utf8_unicode_ci NOT NULL,
  `CACHE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_element`
--

CREATE TABLE `b_iblock_element` (
  `ID` int(11) NOT NULL,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL DEFAULT '0',
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PREVIEW_PICTURE` int(18) DEFAULT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci,
  `PREVIEW_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `DETAIL_TEXT` longtext COLLATE utf8_unicode_ci,
  `DETAIL_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  `WF_STATUS_ID` int(18) DEFAULT '1',
  `WF_PARENT_ELEMENT_ID` int(11) DEFAULT NULL,
  `WF_NEW` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LOCKED_BY` int(18) DEFAULT NULL,
  `WF_DATE_LOCK` datetime DEFAULT NULL,
  `WF_COMMENTS` text COLLATE utf8_unicode_ci,
  `IN_SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LAST_HISTORY_ID` int(11) DEFAULT NULL,
  `SHOW_COUNTER` int(18) DEFAULT NULL,
  `SHOW_COUNTER_START` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_element`
--

INSERT INTO `b_iblock_element` (`ID`, `TIMESTAMP_X`, `MODIFIED_BY`, `DATE_CREATE`, `CREATED_BY`, `IBLOCK_ID`, `IBLOCK_SECTION_ID`, `ACTIVE`, `ACTIVE_FROM`, `ACTIVE_TO`, `SORT`, `NAME`, `PREVIEW_PICTURE`, `PREVIEW_TEXT`, `PREVIEW_TEXT_TYPE`, `DETAIL_PICTURE`, `DETAIL_TEXT`, `DETAIL_TEXT_TYPE`, `SEARCHABLE_CONTENT`, `WF_STATUS_ID`, `WF_PARENT_ELEMENT_ID`, `WF_NEW`, `WF_LOCKED_BY`, `WF_DATE_LOCK`, `WF_COMMENTS`, `IN_SECTIONS`, `XML_ID`, `CODE`, `TAGS`, `TMP_ID`, `WF_LAST_HISTORY_ID`, `SHOW_COUNTER`, `SHOW_COUNTER_START`) VALUES
(4, '2017-08-22 21:53:59', 1, '2017-08-22 21:50:53', 1, 1, 19, 'Y', NULL, NULL, 500, 'Ремень ручейковый GATES 4PK948 MMC Pajero 3.0i', NULL, NULL, 'text', NULL, NULL, 'text', 'РЕМЕНЬ РУЧЕЙКОВЫЙ GATES 4PK948 MMC PAJERO 3.0I\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '4', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(5, '2017-08-22 21:53:59', 1, '2017-08-22 21:50:53', 1, 1, 19, 'Y', NULL, NULL, 500, 'Ремень ручейковый GATES 4PK993 MMC Pajero 3.5i', NULL, NULL, 'text', NULL, NULL, 'text', 'РЕМЕНЬ РУЧЕЙКОВЫЙ GATES 4PK993 MMC PAJERO 3.5I\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '5', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(6, '2017-08-22 21:53:59', 1, '2017-08-22 21:50:53', 1, 1, 19, 'Y', NULL, NULL, 500, 'Ремень ручейковый GATES 4PK1063 MMC Pajero 3.5i (4PK1063)', NULL, NULL, 'text', NULL, NULL, 'text', 'РЕМЕНЬ РУЧЕЙКОВЫЙ GATES 4PK1063 MMC PAJERO 3.5I (4PK1063)\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '6', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(7, '2017-08-22 21:53:59', 1, '2017-08-22 21:50:53', 1, 1, 19, 'Y', NULL, NULL, 500, 'Ремень генератора GATES 6462MC MMC Pajero 3.0i', NULL, NULL, 'text', NULL, NULL, 'text', 'РЕМЕНЬ ГЕНЕРАТОРА GATES 6462MC MMC PAJERO 3.0I\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '7', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(8, '2017-08-22 21:53:59', 1, '2017-08-22 21:50:53', 1, 1, 19, 'Y', NULL, NULL, 500, 'Ремень ручейковый GATES 5PK1123 MMC Pajero 3.0i 91>', NULL, NULL, 'text', NULL, NULL, 'text', 'РЕМЕНЬ РУЧЕЙКОВЫЙ GATES 5PK1123 MMC PAJERO 3.0I 91>\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '8', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(9, '2017-08-22 21:53:59', 1, '2017-08-22 21:50:53', 1, 1, 19, 'Y', NULL, NULL, 500, 'Ремень генератора GATES 6220MC TOYOTA L.Cr.FJ80 4.2TD', NULL, NULL, 'text', NULL, NULL, 'text', 'РЕМЕНЬ ГЕНЕРАТОРА GATES 6220MC TOYOTA L.CR.FJ80 4.2TD\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '9', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(10, '2017-08-22 21:53:59', 1, '2017-08-22 21:50:53', 1, 1, 19, 'Y', NULL, NULL, 500, 'Ремень ГРМ GATES 5228XS MMC Pajero 3.0i -94', NULL, NULL, 'text', NULL, NULL, 'text', 'РЕМЕНЬ ГРМ GATES 5228XS MMC PAJERO 3.0I -94\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '10', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(11, '2017-08-22 21:53:59', 1, '2017-08-22 21:50:53', 1, 1, 20, 'Y', NULL, NULL, 500, 'Ремень ГРМ MMC MD111427 MMC Pajero 3.0 -94 SOHC', NULL, NULL, 'text', NULL, NULL, 'text', 'РЕМЕНЬ ГРМ MMC MD111427 MMC PAJERO 3.0 -94 SOHC\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '11', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(12, '2017-08-22 21:53:59', 1, '2017-08-22 21:50:53', 1, 1, 20, 'Y', NULL, NULL, 500, 'Ремень ГРМ MMC MD307487 MMC Pajero 3.0 94- SOHC', NULL, NULL, 'text', NULL, NULL, 'text', 'РЕМЕНЬ ГРМ MMC MD307487 MMC PAJERO 3.0 94- SOHC\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '12', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(13, '2017-08-22 21:53:59', 1, '2017-08-22 21:50:53', 1, 1, 21, 'Y', NULL, NULL, 500, 'Ремень ГРМ TOYOTA 1356819065 (94*25,4) L.Cr.FJ80/100 HZ HDT', NULL, NULL, 'text', NULL, NULL, 'text', 'РЕМЕНЬ ГРМ TOYOTA 1356819065 (94*25,4) L.CR.FJ80/100 HZ HDT\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '13', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(14, '2017-08-22 21:53:59', 1, '2017-08-22 21:50:53', 1, 1, 19, 'Y', NULL, NULL, 500, 'Ремень генератора GATES 6467MC MMC Pajero 3.0i 3.5i', NULL, NULL, 'text', NULL, NULL, 'text', 'РЕМЕНЬ ГЕНЕРАТОРА GATES 6467MC MMC PAJERO 3.0I 3.5I\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '14', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(15, '2017-08-22 21:53:59', 1, '2017-08-22 21:50:53', 1, 1, 19, 'Y', NULL, NULL, 500, 'Ремень генератора GATES 6478MC TOYOTA 4-Ranner 3.0 2.4TD', NULL, NULL, 'text', NULL, NULL, 'text', 'РЕМЕНЬ ГЕНЕРАТОРА GATES 6478MC TOYOTA 4-RANNER 3.0 2.4TD\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '15', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(16, '2017-08-22 21:53:59', 1, '2017-08-22 21:50:53', 1, 1, 19, 'Y', NULL, NULL, 500, 'Ремень генератора GATES 6481MC TOYOTA L.Cr.FJ80 4.2TD', NULL, NULL, 'text', NULL, NULL, 'text', 'РЕМЕНЬ ГЕНЕРАТОРА GATES 6481MC TOYOTA L.CR.FJ80 4.2TD\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '16', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(17, '2017-08-22 21:53:59', 1, '2017-08-22 21:50:53', 1, 1, 22, 'Y', NULL, NULL, 500, 'Термостат VERNET TH627387J VW Passat 1.6/1.9TD/2.3 86-00/Audi 80/A4/A6 1.9TD 96-', NULL, NULL, 'text', NULL, NULL, 'text', 'ТЕРМОСТАТ VERNET TH627387J VW PASSAT 1.6/1.9TD/2.3 86-00/AUDI 80/A4/A6 1.9TD 96-\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '17', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(18, '2017-08-22 21:53:59', 1, '2017-08-22 21:50:53', 1, 1, 23, 'Y', NULL, NULL, 500, 'Поворотник DEPO 2131515RA ISUZU Trooper 92> R', NULL, NULL, 'text', NULL, NULL, 'text', 'ПОВОРОТНИК DEPO 2131515RA ISUZU TROOPER 92> R\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '18', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(19, '2017-08-22 21:53:59', 1, '2017-08-22 21:50:53', 1, 1, 20, 'Y', NULL, NULL, 500, 'Фонарь MMC MR124963 MMC Pajero 93> L', NULL, NULL, 'text', NULL, NULL, 'text', 'ФОНАРЬ MMC MR124963 MMC PAJERO 93> L\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '19', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(20, '2017-08-22 21:53:59', 1, '2017-08-22 21:50:53', 1, 1, 21, 'Y', NULL, NULL, 500, 'Амортизатор TOYOTA 4851139766 4 Run.-95 пер. газ.', NULL, NULL, 'text', NULL, NULL, 'text', 'АМОРТИЗАТОР TOYOTA 4851139766 4 RUN.-95 ПЕР. ГАЗ.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '20', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(21, '2017-08-22 21:53:59', 1, '2017-08-22 21:50:53', 1, 1, 21, 'Y', NULL, NULL, 500, 'Амортизатор TOYOTA 4851169435 TOYOTA L.Cr.-80 пер.', NULL, NULL, 'text', NULL, NULL, 'text', 'АМОРТИЗАТОР TOYOTA 4851169435 TOYOTA L.CR.-80 ПЕР.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '21', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(22, '2017-08-22 21:53:59', 1, '2017-08-22 21:50:53', 1, 1, 20, 'Y', NULL, NULL, 500, 'Втулка рессоры MMC MB111203 Pajero 84>', NULL, NULL, 'text', NULL, NULL, 'text', 'ВТУЛКА РЕССОРЫ MMC MB111203 PAJERO 84>\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '22', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(23, '2017-08-22 21:53:59', 1, '2017-08-22 21:50:53', 1, 1, 20, 'Y', NULL, NULL, 500, 'Втулка рессоры MMC MB584530 Pajero 91>', NULL, NULL, 'text', NULL, NULL, 'text', 'ВТУЛКА РЕССОРЫ MMC MB584530 PAJERO 91>\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '23', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(24, '2017-08-22 21:53:59', 1, '2017-08-22 21:50:53', 1, 1, 20, 'Y', NULL, NULL, 500, 'Втулка рессоры MMC MB584531 Pajero 91>', NULL, NULL, 'text', NULL, NULL, 'text', 'ВТУЛКА РЕССОРЫ MMC MB584531 PAJERO 91>\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '24', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(25, '2017-08-22 21:53:59', 1, '2017-08-22 21:50:53', 1, 1, 20, 'Y', NULL, NULL, 500, 'Тяга стабил. MMC MB598098 M.Pajero 5дв задн', NULL, NULL, 'text', NULL, NULL, 'text', 'ТЯГА СТАБИЛ. MMC MB598098 M.PAJERO 5ДВ ЗАДН\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '25', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(26, '2017-08-22 21:53:59', 1, '2017-08-22 21:50:53', 1, 1, 24, 'Y', NULL, NULL, 500, 'Втулка стабил. NISSAN 546137F001 Terrano-II задн.', NULL, NULL, 'text', NULL, NULL, 'text', 'ВТУЛКА СТАБИЛ. NISSAN 546137F001 TERRANO-II ЗАДН.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '26', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(27, '2017-08-22 21:53:59', 1, '2017-08-22 21:50:53', 1, 1, 24, 'Y', NULL, NULL, 500, 'Втулка стабил. NISSAN 54613VB010 Patrol Y61 задн. >2000г 18мм', NULL, NULL, 'text', NULL, NULL, 'text', 'ВТУЛКА СТАБИЛ. NISSAN 54613VB010 PATROL Y61 ЗАДН. >2000Г 18ММ\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '27', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(28, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:53', 1, 1, 21, 'Y', NULL, NULL, 500, 'Втулка стабил. TOYOTA 4881520200 D25 4 Runnner 92-95 задн.', NULL, NULL, 'text', NULL, NULL, 'text', 'ВТУЛКА СТАБИЛ. TOYOTA 4881520200 D25 4 RUNNNER 92-95 ЗАДН.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '28', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(29, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:53', 1, 1, 21, 'Y', NULL, NULL, 500, 'Втулка стабил. TOYOTA 4881526020 D25 Ln.Cruiser FJ80 08/92- задн.', NULL, NULL, 'text', NULL, NULL, 'text', 'ВТУЛКА СТАБИЛ. TOYOTA 4881526020 D25 LN.CRUISER FJ80 08/92- ЗАДН.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '29', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(30, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:53', 1, 1, 21, 'Y', NULL, NULL, 500, 'Втулка стабил. TOYOTA 4881530070 D16 4-Run задн.', NULL, NULL, 'text', NULL, NULL, 'text', 'ВТУЛКА СТАБИЛ. TOYOTA 4881530070 D16 4-RUN ЗАДН.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '30', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(31, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:53', 1, 1, 20, 'Y', NULL, NULL, 500, 'Втулка стабил. концевая MMC MB831039 Pajero 91> (2шт+2шайбы+гайка)', NULL, NULL, 'text', NULL, NULL, 'text', 'ВТУЛКА СТАБИЛ. КОНЦЕВАЯ MMC MB831039 PAJERO 91> (2ШТ+2ШАЙБЫ+ГАЙКА)\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '31', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(32, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:53', 1, 1, 24, 'Y', NULL, NULL, 500, 'Втулка стабил. концевая NISSAN 56112V0100 Patrol,Terrano', NULL, NULL, 'text', NULL, NULL, 'text', 'ВТУЛКА СТАБИЛ. КОНЦЕВАЯ NISSAN 56112V0100 PATROL,TERRANO\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '32', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(33, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:53', 1, 1, 21, 'Y', NULL, NULL, 500, 'Втулка стабил. концевая TOYOTA 4881730010 Ln.Cruiser FJ80', NULL, NULL, 'text', NULL, NULL, 'text', 'ВТУЛКА СТАБИЛ. КОНЦЕВАЯ TOYOTA 4881730010 LN.CRUISER FJ80\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '33', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(34, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:53', 1, 1, 21, 'Y', NULL, NULL, 500, 'Втулка стабил. концевая TOYOTA 4881730020 4 Run 93-', NULL, NULL, 'text', NULL, NULL, 'text', 'ВТУЛКА СТАБИЛ. КОНЦЕВАЯ TOYOTA 4881730020 4 RUN 93-\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '34', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(35, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:53', 1, 1, 21, 'Y', NULL, NULL, 500, 'Втулка стабил. концевая TOYOTA 9094801002 4 Runner', NULL, NULL, 'text', NULL, NULL, 'text', 'ВТУЛКА СТАБИЛ. КОНЦЕВАЯ TOYOTA 9094801002 4 RUNNER\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '35', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(36, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:53', 1, 1, 20, 'Y', NULL, NULL, 500, 'Втулка стабил. MMC MR150092 Pajero 91> пер.', NULL, NULL, 'text', NULL, NULL, 'text', 'ВТУЛКА СТАБИЛ. MMC MR150092 PAJERO 91> ПЕР.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '36', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(37, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:53', 1, 1, 20, 'Y', NULL, NULL, 500, 'Втулка стабил. MMC MR150093 Pajero 91> пер.', NULL, NULL, 'text', NULL, NULL, 'text', 'ВТУЛКА СТАБИЛ. MMC MR150093 PAJERO 91> ПЕР.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '37', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(38, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:53', 1, 1, 20, 'Y', NULL, NULL, 500, 'Втулка стабил. MMC MR150095 Pajero 5 дв 94> пер.', NULL, NULL, 'text', NULL, NULL, 'text', 'ВТУЛКА СТАБИЛ. MMC MR150095 PAJERO 5 ДВ 94> ПЕР.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '38', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(39, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:53', 1, 1, 24, 'Y', NULL, NULL, 500, 'Втулка стабил. NISSAN 5461342G00 Terrano 2.4i пер.', NULL, NULL, 'text', NULL, NULL, 'text', 'ВТУЛКА СТАБИЛ. NISSAN 5461342G00 TERRANO 2.4I ПЕР.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '39', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(40, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:53', 1, 1, 24, 'Y', NULL, NULL, 500, 'Втулка стабил. NISSAN 5461388G00 Terrano 2.4i/3.0i/2.7TD 89> пер.', NULL, NULL, 'text', NULL, NULL, 'text', 'ВТУЛКА СТАБИЛ. NISSAN 5461388G00 TERRANO 2.4I/3.0I/2.7TD 89> ПЕР.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '40', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(41, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:53', 1, 1, 24, 'Y', NULL, NULL, 500, 'Втулка стабил. NISSAN 546139C105 NISSAN Terrano II пер.', NULL, NULL, 'text', NULL, NULL, 'text', 'ВТУЛКА СТАБИЛ. NISSAN 546139C105 NISSAN TERRANO II ПЕР.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '41', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(42, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:53', 1, 1, 24, 'Y', NULL, NULL, 500, 'Втулка стабил. NISSAN 54613VB002 Patrol Y61 пер.', NULL, NULL, 'text', NULL, NULL, 'text', 'ВТУЛКА СТАБИЛ. NISSAN 54613VB002 PATROL Y61 ПЕР.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '42', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(43, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:53', 1, 1, 21, 'Y', NULL, NULL, 500, 'Втулка стабил. TOYOTA 4881526250 D23 Ln.Cruiser 100 зад.', NULL, NULL, 'text', NULL, NULL, 'text', 'ВТУЛКА СТАБИЛ. TOYOTA 4881526250 D23 LN.CRUISER 100 ЗАД.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '43', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(44, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:53', 1, 1, 21, 'Y', NULL, NULL, 500, 'Втулка стабил. TOYOTA 4881528080 D24 Ln.Cruiser FJ80 пер.', NULL, NULL, 'text', NULL, NULL, 'text', 'ВТУЛКА СТАБИЛ. TOYOTA 4881528080 D24 LN.CRUISER FJ80 ПЕР.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '44', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(45, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:53', 1, 1, 21, 'Y', NULL, NULL, 500, 'Втулка стабил. TOYOTA 4881530040 D20 Carina E пер.', NULL, NULL, 'text', NULL, NULL, 'text', 'ВТУЛКА СТАБИЛ. TOYOTA 4881530040 D20 CARINA E ПЕР.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '45', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(46, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:53', 1, 1, 21, 'Y', NULL, NULL, 500, 'Втулка стабил. TOYOTA 4881535070 D27 4 Runner 92-95 пер.', NULL, NULL, 'text', NULL, NULL, 'text', 'ВТУЛКА СТАБИЛ. TOYOTA 4881535070 D27 4 RUNNER 92-95 ПЕР.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '46', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(47, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:53', 1, 1, 21, 'Y', NULL, NULL, 500, 'Втулка стабил. TOYOTA 4881560040 D26 Ln.Cr. FJ80 пер.', NULL, NULL, 'text', NULL, NULL, 'text', 'ВТУЛКА СТАБИЛ. TOYOTA 4881560040 D26 LN.CR. FJ80 ПЕР.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '47', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(48, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:53', 1, 1, 21, 'Y', NULL, NULL, 500, 'Втулка стабил. TOYOTA 4881560050 D24 Ln.Cr. FJ80 пер.', NULL, NULL, 'text', NULL, NULL, 'text', 'ВТУЛКА СТАБИЛ. TOYOTA 4881560050 D24 LN.CR. FJ80 ПЕР.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '48', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(49, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:53', 1, 1, 21, 'Y', NULL, NULL, 500, 'Втулка стабил. TOYOTA 4881560070 D29 Ln.Cr. FJ80 пер.', NULL, NULL, 'text', NULL, NULL, 'text', 'ВТУЛКА СТАБИЛ. TOYOTA 4881560070 D29 LN.CR. FJ80 ПЕР.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '49', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(50, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:53', 1, 1, 21, 'Y', NULL, NULL, 500, 'Втулка стабил. TOYOTA 4881560111 D27 Ln.Cr. 100 пер.', NULL, NULL, 'text', NULL, NULL, 'text', 'ВТУЛКА СТАБИЛ. TOYOTA 4881560111 D27 LN.CR. 100 ПЕР.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '50', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(51, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:53', 1, 1, 20, 'Y', NULL, NULL, 500, 'Тяга стабил. MMC MR267876 Pajero 6/93 пер.L', NULL, NULL, 'text', NULL, NULL, 'text', 'ТЯГА СТАБИЛ. MMC MR267876 PAJERO 6/93 ПЕР.L\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '51', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(52, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:53', 1, 1, 20, 'Y', NULL, NULL, 500, 'Тяга стабил. MMC MR267877 Pajero 6/93 пер.R', NULL, NULL, 'text', NULL, NULL, 'text', 'ТЯГА СТАБИЛ. MMC MR267877 PAJERO 6/93 ПЕР.R\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '52', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(53, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:53', 1, 1, 20, 'Y', NULL, NULL, 500, 'Опора шаровая MMC MB860829 MMC Pajero 91> верх. L', NULL, NULL, 'text', NULL, NULL, 'text', 'ОПОРА ШАРОВАЯ MMC MB860829 MMC PAJERO 91> ВЕРХ. L\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '53', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(54, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:53', 1, 1, 20, 'Y', NULL, NULL, 500, 'Опора шаровая MMC MB860830 MMC Pajero 91> верх. R', NULL, NULL, 'text', NULL, NULL, 'text', 'ОПОРА ШАРОВАЯ MMC MB860830 MMC PAJERO 91> ВЕРХ. R\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '54', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(55, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:53', 1, 1, 20, 'Y', NULL, NULL, 500, 'Опора шаровая MMC MR296269 MMC Pajero 91> ниж. L', NULL, NULL, 'text', NULL, NULL, 'text', 'ОПОРА ШАРОВАЯ MMC MR296269 MMC PAJERO 91> НИЖ. L\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '55', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(56, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 20, 'Y', NULL, NULL, 500, 'Опора шаровая MMC MR296270 MMC Pajero 91> ниж. R', NULL, NULL, 'text', NULL, NULL, 'text', 'ОПОРА ШАРОВАЯ MMC MR296270 MMC PAJERO 91> НИЖ. R\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '56', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(57, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 20, 'Y', NULL, NULL, 500, 'С/блок MMC MB109684 M.Pajero 91> пер.ниж.рыч.', NULL, NULL, 'text', NULL, NULL, 'text', 'С/БЛОК MMC MB109684 M.PAJERO 91> ПЕР.НИЖ.РЫЧ.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '57', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(58, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 20, 'Y', NULL, NULL, 500, 'С/блок MMC MB631492 M.Pajero 91-6/93 задн.рыч.', NULL, NULL, 'text', NULL, NULL, 'text', 'С/БЛОК MMC MB631492 M.PAJERO 91-6/93 ЗАДН.РЫЧ.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '58', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(59, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 20, 'Y', NULL, NULL, 500, 'С/блок MMC MR112891 M.Pajero 6/93> задн.рыч.', NULL, NULL, 'text', NULL, NULL, 'text', 'С/БЛОК MMC MR112891 M.PAJERO 6/93> ЗАДН.РЫЧ.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '59', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(60, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 25, 'Y', NULL, NULL, 500, 'Наконечник рулевой OCAP 0193759 TOYOTA 4-Runner внешний.', NULL, NULL, 'text', NULL, NULL, 'text', 'НАКОНЕЧНИК РУЛЕВОЙ OCAP 0193759 TOYOTA 4-RUNNER ВНЕШНИЙ.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '60', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(61, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 21, 'Y', NULL, NULL, 500, 'Наконечник рулевой TOYOTA 4504669135 L.Cr.FJ80 R', NULL, NULL, 'text', NULL, NULL, 'text', 'НАКОНЕЧНИК РУЛЕВОЙ TOYOTA 4504669135 L.CR.FJ80 R\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '61', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(62, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 21, 'Y', NULL, NULL, 500, 'Наконечник рулевой TOYOTA 4504769085 L.Cr.FJ80 L', NULL, NULL, 'text', NULL, NULL, 'text', 'НАКОНЕЧНИК РУЛЕВОЙ TOYOTA 4504769085 L.CR.FJ80 L\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '62', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(63, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 26, 'Y', NULL, NULL, 500, 'Подушка глушителя OPEL 0856024 OPEL Diesel', NULL, NULL, 'text', NULL, NULL, 'text', 'ПОДУШКА ГЛУШИТЕЛЯ OPEL 0856024 OPEL DIESEL\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '63', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(64, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 20, 'Y', NULL, NULL, 500, 'Ремк-т MMC MB858466 MMC Pajero 91> суппорта задн.', NULL, NULL, 'text', NULL, NULL, 'text', 'РЕМК-Т MMC MB858466 MMC PAJERO 91> СУППОРТА ЗАДН.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '64', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(65, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 20, 'Y', NULL, NULL, 500, 'Корзина сцепления MMC MR317682 MMC  (D250) Pajero 2.8TD', NULL, NULL, 'text', NULL, NULL, 'text', 'КОРЗИНА СЦЕПЛЕНИЯ MMC MR317682 MMC  (D250) PAJERO 2.8TD\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '65', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(66, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 20, 'Y', NULL, NULL, 500, 'Сальник MMC MB160578 42*65*12 MMC Pajero пер.моста', NULL, NULL, 'text', NULL, NULL, 'text', 'САЛЬНИК MMC MB160578 42*65*12 MMC PAJERO ПЕР.МОСТА\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '66', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(67, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 20, 'Y', NULL, NULL, 500, 'Сальник раздатки MMC MB919210 MMC Pajero на кардан', NULL, NULL, 'text', NULL, NULL, 'text', 'САЛЬНИК РАЗДАТКИ MMC MB919210 MMC PAJERO НА КАРДАН\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '67', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(68, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 27, 'Y', NULL, NULL, 500, 'Фильтр масляный FRAM PH3614 TOYOTA, Chrysler Voyager 2.4 ВОЛГА', NULL, NULL, 'text', NULL, NULL, 'text', 'ФИЛЬТР МАСЛЯНЫЙ FRAM PH3614 TOYOTA, CHRYSLER VOYAGER 2.4 ВОЛГА\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '68', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(69, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 27, 'Y', NULL, NULL, 500, 'Фильтр масляный FRAM PH6355 MMC 2.5TD', NULL, NULL, 'text', NULL, NULL, 'text', 'ФИЛЬТР МАСЛЯНЫЙ FRAM PH6355 MMC 2.5TD\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '69', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(70, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 28, 'Y', NULL, NULL, 500, 'Фильтр масляный BOSCH 0986452063 MMC Pajero 2.8TD', NULL, NULL, 'text', NULL, NULL, 'text', 'ФИЛЬТР МАСЛЯНЫЙ BOSCH 0986452063 MMC PAJERO 2.8TD\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '70', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(71, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 29, 'Y', NULL, NULL, 500, 'Антифриз FEBI 01089 синий 1.5L концентрат 1:1 -40°C', NULL, NULL, 'text', NULL, NULL, 'text', 'АНТИФРИЗ FEBI 01089 СИНИЙ 1.5L КОНЦЕНТРАТ 1:1 -40°C\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '71', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(72, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 20, 'Y', NULL, NULL, 500, 'Фильтр топливный MMC MB220900 MMC Pajero 2.5TD 2.8D TD', NULL, NULL, 'text', NULL, NULL, 'text', 'ФИЛЬТР ТОПЛИВНЫЙ MMC MB220900 MMC PAJERO 2.5TD 2.8D TD\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '72', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(73, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 20, 'Y', NULL, NULL, 500, 'Провода в/в MMC MD311208 MMC Pajero 3.5', NULL, NULL, 'text', NULL, NULL, 'text', 'ПРОВОДА В/В MMC MD311208 MMC PAJERO 3.5\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '73', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(74, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 21, 'Y', NULL, NULL, 500, 'Свеча зажигания TOYOTA 9091901176 K16RU T.L.Cr.-80 4-Runner', NULL, NULL, 'text', NULL, NULL, 'text', 'СВЕЧА ЗАЖИГАНИЯ TOYOTA 9091901176 K16RU T.L.CR.-80 4-RUNNER\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '74', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(75, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 30, 'Y', NULL, NULL, 500, 'Лампа MTF Light HVN1203 VANADIUM бело-голубой 5000K 55W 12V комплект 2 ШТ', NULL, NULL, 'text', NULL, NULL, 'text', 'ЛАМПА MTF LIGHT HVN1203 VANADIUM БЕЛО-ГОЛУБОЙ 5000K 55W 12V КОМПЛЕКТ 2 ШТ\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '75', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(76, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 31, 'Y', NULL, NULL, 500, 'Коврики а/м NORPLAST NPLPO6312 OPEL CORSA D 06--> полиур-н черн. с борт. компл. 4шт с крепл.', NULL, NULL, 'text', NULL, NULL, 'text', 'КОВРИКИ А/М NORPLAST NPLPO6312 OPEL CORSA D 06--> ПОЛИУР-Н ЧЕРН. С БОРТ. КОМПЛ. 4ШТ С КРЕПЛ.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '76', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(77, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 30, 'Y', NULL, NULL, 500, 'Лампа MTF Light H8A1211 ARGENTUM +80% больше света 4000K55W 12V комплект 2 ШТ', NULL, NULL, 'text', NULL, NULL, 'text', 'ЛАМПА MTF LIGHT H8A1211 ARGENTUM +80% БОЛЬШЕ СВЕТА 4000K55W 12V КОМПЛЕКТ 2 ШТ\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '77', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(78, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 32, 'Y', NULL, NULL, 500, 'Лампа SVS 0210043000 5000K CLASSIC XENON 35W D4S', NULL, NULL, 'text', NULL, NULL, 'text', 'ЛАМПА SVS 0210043000 5000K CLASSIC XENON 35W D4S\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '78', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(79, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 33, 'Y', NULL, NULL, 500, 'Защита двигателя ALFECO 1402 MMC LANCER X 07-->; ASX 1.8 10---> OUTLANDER XL 06--12  /DELICA D5 07--> +  КПП сталь 2мм с крепл.', NULL, NULL, 'text', NULL, NULL, 'text', 'ЗАЩИТА ДВИГАТЕЛЯ ALFECO 1402 MMC LANCER X 07-->; ASX 1.8 10---> OUTLANDER XL 06--12  /DELICA D5 07--> +  КПП СТАЛЬ 2ММ С КРЕПЛ.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '79', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(80, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 31, 'Y', NULL, NULL, 500, 'Коврики а/м NORPLAST NPLPO6438 PEUGEOT 308 08-->  полиуретан черн. с борт. компл. 4шт', NULL, NULL, 'text', NULL, NULL, 'text', 'КОВРИКИ А/М NORPLAST NPLPO6438 PEUGEOT 308 08-->  ПОЛИУРЕТАН ЧЕРН. С БОРТ. КОМПЛ. 4ШТ\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '80', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(81, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 31, 'Y', NULL, NULL, 500, 'Коврики а/м NORPLAST NPLPO9523 VW JETTA 05--10 полиур. черн. с борт компл. 4 шт. с крепл.', NULL, NULL, 'text', NULL, NULL, 'text', 'КОВРИКИ А/М NORPLAST NPLPO9523 VW JETTA 05--10 ПОЛИУР. ЧЕРН. С БОРТ КОМПЛ. 4 ШТ. С КРЕПЛ.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '81', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(82, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 34, 'Y', NULL, NULL, 500, 'Освежитель на дефлектор SLIM SLMV56 Зеленое яблоко 8 мл  жидкий', NULL, NULL, 'text', NULL, NULL, 'text', 'ОСВЕЖИТЕЛЬ НА ДЕФЛЕКТОР SLIM SLMV56 ЗЕЛЕНОЕ ЯБЛОКО 8 МЛ  ЖИДКИЙ\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '82', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(83, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 31, 'Y', NULL, NULL, 500, 'Коврики а/м NORPLAST NPLPO5621 MB MERCEDES-BENZ W210   95-02 полиуретан черн. с борт. компл 4шт. с крепл.', NULL, NULL, 'text', NULL, NULL, 'text', 'КОВРИКИ А/М NORPLAST NPLPO5621 MB MERCEDES-BENZ W210   95-02 ПОЛИУРЕТАН ЧЕРН. С БОРТ. КОМПЛ 4ШТ. С КРЕПЛ.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '83', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(84, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 31, 'Y', NULL, NULL, 500, 'Коврики а/м NORPLAST NPLPO6426 PEUGEOT 206 98--09 полиуретан черн.с борт. компл. 4шт', NULL, NULL, 'text', NULL, NULL, 'text', 'КОВРИКИ А/М NORPLAST NPLPO6426 PEUGEOT 206 98--09 ПОЛИУРЕТАН ЧЕРН.С БОРТ. КОМПЛ. 4ШТ\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '84', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(85, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 35, 'Y', NULL, NULL, 500, 'Освежитель подвесной AIR COUTURE AIR5 аромат FAHRENHEIT Cristian Dior', NULL, NULL, 'text', NULL, NULL, 'text', 'ОСВЕЖИТЕЛЬ ПОДВЕСНОЙ AIR COUTURE AIR5 АРОМАТ FAHRENHEIT CRISTIAN DIOR\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '85', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(86, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 36, 'Y', NULL, NULL, 500, 'Устройство зарядное AIRLINE ACHM01 унив. для моб. телефонов 8 в 1,  12в/24в, шнур -рулетка', NULL, NULL, 'text', NULL, NULL, 'text', 'УСТРОЙСТВО ЗАРЯДНОЕ AIRLINE ACHM01 УНИВ. ДЛЯ МОБ. ТЕЛЕФОНОВ 8 В 1,  12В/24В, ШНУР -РУЛЕТКА\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '86', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(87, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 35, 'Y', NULL, NULL, 500, 'Освежитель подвесной AIR COUTURE AIR11 аромат S.T.DUPONT ESSENCE PURE Pour Homme', NULL, NULL, 'text', NULL, NULL, 'text', 'ОСВЕЖИТЕЛЬ ПОДВЕСНОЙ AIR COUTURE AIR11 АРОМАТ S.T.DUPONT ESSENCE PURE POUR HOMME\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '87', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(88, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 31, 'Y', NULL, NULL, 500, 'Коврики а/м NORPLAST NPLPO8548 SUZUKI SWIFT 10--> полиуретан черн. с борт. компл. 4шт с крепл.', NULL, NULL, 'text', NULL, NULL, 'text', 'КОВРИКИ А/М NORPLAST NPLPO8548 SUZUKI SWIFT 10--> ПОЛИУРЕТАН ЧЕРН. С БОРТ. КОМПЛ. 4ШТ С КРЕПЛ.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '88', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(89, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 35, 'Y', NULL, NULL, 500, 'Освежитель подвесной AIR COUTURE AIR3 аромат ACQUA DI GIO Giorgio Armani', NULL, NULL, 'text', NULL, NULL, 'text', 'ОСВЕЖИТЕЛЬ ПОДВЕСНОЙ AIR COUTURE AIR3 АРОМАТ ACQUA DI GIO GIORGIO ARMANI\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '89', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(90, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 35, 'Y', NULL, NULL, 500, 'Освежитель подвесной AIR COUTURE AIR15 аромат CHROME Azzaro', NULL, NULL, 'text', NULL, NULL, 'text', 'ОСВЕЖИТЕЛЬ ПОДВЕСНОЙ AIR COUTURE AIR15 АРОМАТ CHROME AZZARO\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '90', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(91, '2017-08-22 21:54:00', 1, '2017-08-22 21:50:54', 1, 1, 31, 'Y', NULL, NULL, 500, 'Коврики а/м NORPLAST NPLPO1209 CHEVROLET EPICA 06-->полиуретан черн. с борт. крмпл. 4шт с крепл.', NULL, NULL, 'text', NULL, NULL, 'text', 'КОВРИКИ А/М NORPLAST NPLPO1209 CHEVROLET EPICA 06-->ПОЛИУРЕТАН ЧЕРН. С БОРТ. КРМПЛ. 4ШТ С КРЕПЛ.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '91', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(92, '2017-08-22 21:54:01', 1, '2017-08-22 21:50:54', 1, 1, 37, 'Y', NULL, NULL, 500, 'Коврики а/м AILERON 61501 RENAULT LOGAN 06--14 полиуретан черн. с борт. компл. 4шт', NULL, NULL, 'text', NULL, NULL, 'text', 'КОВРИКИ А/М AILERON 61501 RENAULT LOGAN 06--14 ПОЛИУРЕТАН ЧЕРН. С БОРТ. КОМПЛ. 4ШТ\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '92', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(93, '2017-08-22 21:54:01', 1, '2017-08-22 21:50:54', 1, 1, 38, 'Y', NULL, NULL, 500, 'Освежитель кондиционера CARMATE D38RU с бактериц. эффектом. Устраняет неприятн. запахи. С ионами серебра. 40мл', NULL, NULL, 'text', NULL, NULL, 'text', 'ОСВЕЖИТЕЛЬ КОНДИЦИОНЕРА CARMATE D38RU С БАКТЕРИЦ. ЭФФЕКТОМ. УСТРАНЯЕТ НЕПРИЯТН. ЗАПАХИ. С ИОНАМИ СЕРЕБРА. 40МЛ\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '93', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(94, '2017-08-22 21:54:01', 1, '2017-08-22 21:50:54', 1, 1, 31, 'Y', NULL, NULL, 500, 'Коврики а/м NORPLAST NPLPO5948 MMC PAJERO IV  07--> полиуретан черн. с борт. компл. 4 шт. с крепл.', NULL, NULL, 'text', NULL, NULL, 'text', 'КОВРИКИ А/М NORPLAST NPLPO5948 MMC PAJERO IV  07--> ПОЛИУРЕТАН ЧЕРН. С БОРТ. КОМПЛ. 4 ШТ. С КРЕПЛ.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '94', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(95, '2017-08-22 21:54:01', 1, '2017-08-22 21:50:54', 1, 1, 39, 'Y', NULL, NULL, 500, 'Дефлектор SIM SVOTIG0832 окон VW TIGUAN 08--> клеящ. компл. 4шт темн.', NULL, NULL, 'text', NULL, NULL, 'text', 'ДЕФЛЕКТОР SIM SVOTIG0832 ОКОН VW TIGUAN 08--> КЛЕЯЩ. КОМПЛ. 4ШТ ТЕМН.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '95', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(96, '2017-08-22 21:54:01', 1, '2017-08-22 21:50:54', 1, 1, 31, 'Y', NULL, NULL, 500, 'Коврики а/м NORPLAST NPLPO0706 BMW X5 E70 07--13/X6 E71; E72 08--> полиуретан черн. с борт. с крепл.', NULL, NULL, 'text', NULL, NULL, 'text', 'КОВРИКИ А/М NORPLAST NPLPO0706 BMW X5 E70 07--13/X6 E71; E72 08--> ПОЛИУРЕТАН ЧЕРН. С БОРТ. С КРЕПЛ.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '96', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(97, '2017-08-22 21:54:01', 1, '2017-08-22 21:50:54', 1, 1, 41, 'Y', NULL, NULL, 500, 'Знак аварийной остановки РОССИЯ 25724 металл. ДИАЛУЧ соотв. ГОСТ (108104)', NULL, NULL, 'text', NULL, NULL, 'text', 'ЗНАК АВАРИЙНОЙ ОСТАНОВКИ РОССИЯ 25724 МЕТАЛЛ. ДИАЛУЧ СООТВ. ГОСТ (108104)\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '97', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(98, '2017-08-22 21:54:01', 1, '2017-08-22 21:50:54', 1, 1, 42, 'Y', NULL, NULL, 500, 'Изолента ЗЕБРА 6320 19мм х 25м черная Китай', NULL, NULL, 'text', NULL, NULL, 'text', 'ИЗОЛЕНТА ЗЕБРА 6320 19ММ Х 25М ЧЕРНАЯ КИТАЙ\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '98', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(99, '2017-08-22 21:54:01', 1, '2017-08-22 21:50:54', 1, 1, 43, 'Y', NULL, NULL, 500, 'Перчатки рабочие ДиаЛУЧ 25643 а/м белые с ПВХ высш.сорт (2шт)', NULL, NULL, 'text', NULL, NULL, 'text', 'ПЕРЧАТКИ РАБОЧИЕ ДИАЛУЧ 25643 А/М БЕЛЫЕ С ПВХ ВЫСШ.СОРТ (2ШТ)\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '99', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(100, '2017-08-22 21:54:01', 1, '2017-08-22 21:50:54', 1, 1, 31, 'Y', NULL, NULL, 500, 'Коврики а/м NORPLAST NPLPO9550 VW TIGUAN 08--> 11--> полиуретан черн. с борт. компл. 4шт с крепл.', NULL, NULL, 'text', NULL, NULL, 'text', 'КОВРИКИ А/М NORPLAST NPLPO9550 VW TIGUAN 08--> 11--> ПОЛИУРЕТАН ЧЕРН. С БОРТ. КОМПЛ. 4ШТ С КРЕПЛ.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '100', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(101, '2017-08-22 21:54:01', 1, '2017-08-22 21:50:54', 1, 1, 31, 'Y', NULL, NULL, 500, 'Коврики а/м NORPLAST NPLPO6310 OPEL ASTRA J 2010--> полиуретан черн. с борт. компл. 4шт с крепл.', NULL, NULL, 'text', NULL, NULL, 'text', 'КОВРИКИ А/М NORPLAST NPLPO6310 OPEL ASTRA J 2010--> ПОЛИУРЕТАН ЧЕРН. С БОРТ. КОМПЛ. 4ШТ С КРЕПЛ.\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '101', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL),
(102, '2017-08-22 21:54:01', 1, '2017-08-22 21:50:54', 1, 1, 31, 'Y', NULL, NULL, 500, 'Коврики а/м NORPLAST NPLPO6171 NISSAN TEANA 2008--13 полиуретан черн. с борт. компл. 4шт', NULL, NULL, 'text', NULL, NULL, 'text', 'КОВРИКИ А/М NORPLAST NPLPO6171 NISSAN TEANA 2008--13 ПОЛИУРЕТАН ЧЕРН. С БОРТ. КОМПЛ. 4ШТ\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '102', NULL, NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_element_iprop`
--

CREATE TABLE `b_iblock_element_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_element_lock`
--

CREATE TABLE `b_iblock_element_lock` (
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `DATE_LOCK` datetime DEFAULT NULL,
  `LOCKED_BY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_element_property`
--

CREATE TABLE `b_iblock_element_property` (
  `ID` int(11) NOT NULL,
  `IBLOCK_PROPERTY_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  `VALUE_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `VALUE_ENUM` int(11) DEFAULT NULL,
  `VALUE_NUM` decimal(18,4) DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_element_property`
--

INSERT INTO `b_iblock_element_property` (`ID`, `IBLOCK_PROPERTY_ID`, `IBLOCK_ELEMENT_ID`, `VALUE`, `VALUE_TYPE`, `VALUE_ENUM`, `VALUE_NUM`, `DESCRIPTION`) VALUES
(322, 1, 4, '4PK948', 'text', NULL, '4.0000', NULL),
(323, 2, 4, '314.04', 'text', NULL, '314.0400', NULL),
(324, 3, 4, '500', 'text', NULL, '500.0000', NULL),
(325, 1, 5, '4PK993', 'text', NULL, '4.0000', NULL),
(326, 2, 5, '332.25', 'text', NULL, '332.2500', NULL),
(327, 3, 5, '1', 'text', NULL, '1.0000', NULL),
(328, 1, 6, '4PK1063', 'text', NULL, '4.0000', NULL),
(329, 2, 6, '373.4', 'text', NULL, '373.4000', NULL),
(330, 3, 6, '36', 'text', NULL, '36.0000', NULL),
(331, 1, 7, '6462MC', 'text', NULL, '6462.0000', NULL),
(332, 2, 7, '185.54', 'text', NULL, '185.5400', NULL),
(333, 3, 7, '8', 'text', NULL, '8.0000', NULL),
(334, 1, 8, '5PK1123', 'text', NULL, '5.0000', NULL),
(335, 2, 8, '442.81', 'text', NULL, '442.8100', NULL),
(336, 3, 8, '4', 'text', NULL, '4.0000', NULL),
(337, 1, 9, '6220MC', 'text', NULL, '6220.0000', NULL),
(338, 2, 9, '175.11', 'text', NULL, '175.1100', NULL),
(339, 3, 9, '36', 'text', NULL, '36.0000', NULL),
(340, 1, 10, '5228XS', 'text', NULL, '5228.0000', NULL),
(341, 2, 10, '1047.39', 'text', NULL, '1047.3900', NULL),
(342, 3, 10, '2', 'text', NULL, '2.0000', NULL),
(343, 1, 11, 'MD111427', 'text', NULL, '0.0000', NULL),
(344, 2, 11, '2654.55', 'text', NULL, '2654.5500', NULL),
(345, 3, 11, '1', 'text', NULL, '1.0000', NULL),
(346, 1, 12, 'MD307487', 'text', NULL, '0.0000', NULL),
(347, 2, 12, '3294.09', 'text', NULL, '3294.0900', NULL),
(348, 3, 12, '4', 'text', NULL, '4.0000', NULL),
(349, 1, 13, '1356819065', 'text', NULL, '1356819065.0000', NULL),
(350, 2, 13, '2354.73', 'text', NULL, '2354.7300', NULL),
(351, 3, 13, '4', 'text', NULL, '4.0000', NULL),
(352, 1, 14, '6467MC', 'text', NULL, '6467.0000', NULL),
(353, 2, 14, '211.04', 'text', NULL, '211.0400', NULL),
(354, 3, 14, '8', 'text', NULL, '8.0000', NULL),
(355, 1, 15, '6478MC', 'text', NULL, '6478.0000', NULL),
(356, 2, 15, '270.35', 'text', NULL, '270.3500', NULL),
(357, 3, 15, '1', 'text', NULL, '1.0000', NULL),
(358, 1, 16, '6481MC', 'text', NULL, '6481.0000', NULL),
(359, 2, 16, '279.24', 'text', NULL, '279.2400', NULL),
(360, 3, 16, '1', 'text', NULL, '1.0000', NULL),
(361, 1, 17, 'TH627387J', 'text', NULL, '0.0000', NULL),
(362, 2, 17, '392.15', 'text', NULL, '392.1500', NULL),
(363, 3, 17, '3', 'text', NULL, '3.0000', NULL),
(364, 1, 18, '2131515RA', 'text', NULL, '2131515.0000', NULL),
(365, 2, 18, '534.09', 'text', NULL, '534.0900', NULL),
(366, 3, 18, '1', 'text', NULL, '1.0000', NULL),
(367, 1, 19, 'MR124963', 'text', NULL, '0.0000', NULL),
(368, 2, 19, '1222.73', 'text', NULL, '1222.7300', NULL),
(369, 3, 19, '1', 'text', NULL, '1.0000', NULL),
(370, 1, 20, '4851139766', 'text', NULL, '4851139766.0000', NULL),
(371, 2, 20, '1529.09', 'text', NULL, '1529.0900', NULL),
(372, 3, 20, '2', 'text', NULL, '2.0000', NULL),
(373, 1, 21, '4851169435', 'text', NULL, '4851169435.0000', NULL),
(374, 2, 21, '3263.73', 'text', NULL, '3263.7300', NULL),
(375, 3, 21, '2', 'text', NULL, '2.0000', NULL),
(376, 1, 22, 'MB111203', 'text', NULL, '0.0000', NULL),
(377, 2, 22, '141.32', 'text', NULL, '141.3200', NULL),
(378, 3, 22, '4', 'text', NULL, '4.0000', NULL),
(379, 1, 23, 'MB584530', 'text', NULL, '0.0000', NULL),
(380, 2, 23, '113.22', 'text', NULL, '113.2200', NULL),
(381, 3, 23, '1', 'text', NULL, '1.0000', NULL),
(382, 1, 24, 'MB584531', 'text', NULL, '0.0000', NULL),
(383, 2, 24, '49.18', 'text', NULL, '49.1800', NULL),
(384, 3, 24, '50', 'text', NULL, '50.0000', NULL),
(385, 1, 25, 'MB598098', 'text', NULL, '0.0000', NULL),
(386, 2, 25, '955.37', 'text', NULL, '955.3700', NULL),
(387, 3, 25, '4', 'text', NULL, '4.0000', NULL),
(388, 1, 26, '546137F001', 'text', NULL, '546137.0000', NULL),
(389, 2, 26, '346.55', 'text', NULL, '346.5500', NULL),
(390, 3, 26, '2', 'text', NULL, '2.0000', NULL),
(391, 1, 27, '54613VB010', 'text', NULL, '54613.0000', NULL),
(392, 2, 27, '248.45', 'text', NULL, '248.4500', NULL),
(393, 3, 27, '1', 'text', NULL, '1.0000', NULL),
(394, 1, 28, '4881520200', 'text', NULL, '4881520200.0000', NULL),
(395, 2, 28, '293.86', 'text', NULL, '293.8600', NULL),
(396, 3, 28, '1', 'text', NULL, '1.0000', NULL),
(397, 1, 29, '4881526020', 'text', NULL, '4881526020.0000', NULL),
(398, 2, 29, '262.27', 'text', NULL, '262.2700', NULL),
(399, 3, 29, '1', 'text', NULL, '1.0000', NULL),
(400, 1, 30, '4881530070', 'text', NULL, '4881530070.0000', NULL),
(401, 2, 30, '173.64', 'text', NULL, '173.6400', NULL),
(402, 3, 30, '1', 'text', NULL, '1.0000', NULL),
(403, 1, 31, 'MB831039', 'text', NULL, '0.0000', NULL),
(404, 2, 31, '577.4', 'text', NULL, '577.4000', NULL),
(405, 3, 31, '1', 'text', NULL, '1.0000', NULL),
(406, 1, 32, '56112V0100', 'text', NULL, '56112.0000', NULL),
(407, 2, 32, '58.18', 'text', NULL, '58.1800', NULL),
(408, 3, 32, '50', 'text', NULL, '50.0000', NULL),
(409, 1, 33, '4881730010', 'text', NULL, '4881730010.0000', NULL),
(410, 2, 33, '87.27', 'text', NULL, '87.2700', NULL),
(411, 3, 33, '2', 'text', NULL, '2.0000', NULL),
(412, 1, 34, '4881730020', 'text', NULL, '4881730020.0000', NULL),
(413, 2, 34, '88.53', 'text', NULL, '88.5300', NULL),
(414, 3, 34, '2', 'text', NULL, '2.0000', NULL),
(415, 1, 35, '9094801002', 'text', NULL, '9094801002.0000', NULL),
(416, 2, 35, '80.55', 'text', NULL, '80.5500', NULL),
(417, 3, 35, '1', 'text', NULL, '1.0000', NULL),
(418, 1, 36, 'MR150092', 'text', NULL, '0.0000', NULL),
(419, 2, 36, '267.55', 'text', NULL, '267.5500', NULL),
(420, 3, 36, '2', 'text', NULL, '2.0000', NULL),
(421, 1, 37, 'MR150093', 'text', NULL, '0.0000', NULL),
(422, 2, 37, '195.91', 'text', NULL, '195.9100', NULL),
(423, 3, 37, '1', 'text', NULL, '1.0000', NULL),
(424, 1, 38, 'MR150095', 'text', NULL, '0.0000', NULL),
(425, 2, 38, '213.64', 'text', NULL, '213.6400', NULL),
(426, 3, 38, '7', 'text', NULL, '7.0000', NULL),
(427, 1, 39, '5461342G00', 'text', NULL, '5461342.0000', NULL),
(428, 2, 39, '204.78', 'text', NULL, '204.7800', NULL),
(429, 3, 39, '9', 'text', NULL, '9.0000', NULL),
(430, 1, 40, '5461388G00', 'text', NULL, '5461388.0000', NULL),
(431, 2, 40, '287.09', 'text', NULL, '287.0900', NULL),
(432, 3, 40, '1', 'text', NULL, '1.0000', NULL),
(433, 1, 41, '546139C105', 'text', NULL, '546139.0000', NULL),
(434, 2, 41, '206.09', 'text', NULL, '206.0900', NULL),
(435, 3, 41, '2', 'text', NULL, '2.0000', NULL),
(436, 1, 42, '54613VB002', 'text', NULL, '54613.0000', NULL),
(437, 2, 42, '259.82', 'text', NULL, '259.8200', NULL),
(438, 3, 42, '2', 'text', NULL, '2.0000', NULL),
(439, 1, 43, '4881526250', 'text', NULL, '4881526250.0000', NULL),
(440, 2, 43, '403.18', 'text', NULL, '403.1800', NULL),
(441, 3, 43, '1', 'text', NULL, '1.0000', NULL),
(442, 1, 44, '4881528080', 'text', NULL, '4881528080.0000', NULL),
(443, 2, 44, '294.58', 'text', NULL, '294.5800', NULL),
(444, 3, 44, '36', 'text', NULL, '36.0000', NULL),
(445, 1, 45, '4881530040', 'text', NULL, '4881530040.0000', NULL),
(446, 2, 45, '210.91', 'text', NULL, '210.9100', NULL),
(447, 3, 45, '3', 'text', NULL, '3.0000', NULL),
(448, 1, 46, '4881535070', 'text', NULL, '4881535070.0000', NULL),
(449, 2, 46, '286.64', 'text', NULL, '286.6400', NULL),
(450, 3, 46, '1', 'text', NULL, '1.0000', NULL),
(451, 1, 47, '4881560040', 'text', NULL, '4881560040.0000', NULL),
(452, 2, 47, '336.45', 'text', NULL, '336.4500', NULL),
(453, 3, 47, '2', 'text', NULL, '2.0000', NULL),
(454, 1, 48, '4881560050', 'text', NULL, '4881560050.0000', NULL),
(455, 2, 48, '260.73', 'text', NULL, '260.7300', NULL),
(456, 3, 48, '2', 'text', NULL, '2.0000', NULL),
(457, 1, 49, '4881560070', 'text', NULL, '4881560070.0000', NULL),
(458, 2, 49, '306.64', 'text', NULL, '306.6400', NULL),
(459, 3, 49, '1', 'text', NULL, '1.0000', NULL),
(460, 1, 50, '4881560111', 'text', NULL, '4881560111.0000', NULL),
(461, 2, 50, '333', 'text', NULL, '333.0000', NULL),
(462, 3, 50, '4', 'text', NULL, '4.0000', NULL),
(463, 1, 51, 'MR267876', 'text', NULL, '0.0000', NULL),
(464, 2, 51, '1086.36', 'text', NULL, '1086.3600', NULL),
(465, 3, 51, '1', 'text', NULL, '1.0000', NULL),
(466, 1, 52, 'MR267877', 'text', NULL, '0.0000', NULL),
(467, 2, 52, '1047.25', 'text', NULL, '1047.2500', NULL),
(468, 3, 52, '1', 'text', NULL, '1.0000', NULL),
(469, 1, 53, 'MB860829', 'text', NULL, '0.0000', NULL),
(470, 2, 53, '1653.91', 'text', NULL, '1653.9100', NULL),
(471, 3, 53, '2', 'text', NULL, '2.0000', NULL),
(472, 1, 54, 'MB860830', 'text', NULL, '0.0000', NULL),
(473, 2, 54, '1654.36', 'text', NULL, '1654.3600', NULL),
(474, 3, 54, '1', 'text', NULL, '1.0000', NULL),
(475, 1, 55, 'MR296269', 'text', NULL, '0.0000', NULL),
(476, 2, 55, '2027.18', 'text', NULL, '2027.1800', NULL),
(477, 3, 55, '2', 'text', NULL, '2.0000', NULL),
(478, 1, 56, 'MR296270', 'text', NULL, '0.0000', NULL),
(479, 2, 56, '2293.85', 'text', NULL, '2293.8500', NULL),
(480, 3, 56, '1', 'text', NULL, '1.0000', NULL),
(481, 1, 57, 'MB109684', 'text', NULL, '0.0000', NULL),
(482, 2, 57, '660.36', 'text', NULL, '660.3600', NULL),
(483, 3, 57, '5', 'text', NULL, '5.0000', NULL),
(484, 1, 58, 'MB631492', 'text', NULL, '0.0000', NULL),
(485, 2, 58, '1354.27', 'text', NULL, '1354.2700', NULL),
(486, 3, 58, '4', 'text', NULL, '4.0000', NULL),
(487, 1, 59, 'MR112891', 'text', NULL, '0.0000', NULL),
(488, 2, 59, '922.33', 'text', NULL, '922.3300', NULL),
(489, 3, 59, '4', 'text', NULL, '4.0000', NULL),
(490, 1, 60, '0193759', 'text', NULL, '193759.0000', NULL),
(491, 2, 60, '232.34', 'text', NULL, '232.3400', NULL),
(492, 3, 60, '1', 'text', NULL, '1.0000', NULL),
(493, 1, 61, '4504669135', 'text', NULL, '4504669135.0000', NULL),
(494, 2, 61, '1630.91', 'text', NULL, '1630.9100', NULL),
(495, 3, 61, '2', 'text', NULL, '2.0000', NULL),
(496, 1, 62, '4504769085', 'text', NULL, '4504769085.0000', NULL),
(497, 2, 62, '1727.64', 'text', NULL, '1727.6400', NULL),
(498, 3, 62, '1', 'text', NULL, '1.0000', NULL),
(499, 1, 63, '0856024', 'text', NULL, '856024.0000', NULL),
(500, 2, 63, '155.94', 'text', NULL, '155.9400', NULL),
(501, 3, 63, '1', 'text', NULL, '1.0000', NULL),
(502, 1, 64, 'MB858466', 'text', NULL, '0.0000', NULL),
(503, 2, 64, '568.26', 'text', NULL, '568.2600', NULL),
(504, 3, 64, '2', 'text', NULL, '2.0000', NULL),
(505, 1, 65, 'MR317682', 'text', NULL, '0.0000', NULL),
(506, 2, 65, '12777.36', 'text', NULL, '12777.3600', NULL),
(507, 3, 65, '1', 'text', NULL, '1.0000', NULL),
(508, 1, 66, 'MB160578', 'text', NULL, '0.0000', NULL),
(509, 2, 66, '297.36', 'text', NULL, '297.3600', NULL),
(510, 3, 66, '3', 'text', NULL, '3.0000', NULL),
(511, 1, 67, 'MB919210', 'text', NULL, '0.0000', NULL),
(512, 2, 67, '338.36', 'text', NULL, '338.3600', NULL),
(513, 3, 67, '5', 'text', NULL, '5.0000', NULL),
(514, 1, 68, 'PH3614', 'text', NULL, '0.0000', NULL),
(515, 2, 68, '214.82', 'text', NULL, '214.8200', NULL),
(516, 3, 68, '3', 'text', NULL, '3.0000', NULL),
(517, 1, 69, 'PH6355', 'text', NULL, '0.0000', NULL),
(518, 2, 69, '447.47', 'text', NULL, '447.4700', NULL),
(519, 3, 69, '36', 'text', NULL, '36.0000', NULL),
(520, 1, 70, '0986452063', 'text', NULL, '986452063.0000', NULL),
(521, 2, 70, '540.46', 'text', NULL, '540.4600', NULL),
(522, 3, 70, '8', 'text', NULL, '8.0000', NULL),
(523, 1, 71, '01089', 'text', NULL, '1089.0000', NULL),
(524, 2, 71, '310.27', 'text', NULL, '310.2700', NULL),
(525, 3, 71, '101', 'text', NULL, '101.0000', NULL),
(526, 1, 72, 'MB220900', 'text', NULL, '0.0000', NULL),
(527, 2, 72, '837.27', 'text', NULL, '837.2700', NULL),
(528, 3, 72, '2', 'text', NULL, '2.0000', NULL),
(529, 1, 73, 'MD311208', 'text', NULL, '0.0000', NULL),
(530, 2, 73, '4149.36', 'text', NULL, '4149.3600', NULL),
(531, 3, 73, '2', 'text', NULL, '2.0000', NULL),
(532, 1, 74, '9091901176', 'text', NULL, '9091901176.0000', NULL),
(533, 2, 74, '134.18', 'text', NULL, '134.1800', NULL),
(534, 3, 74, '36', 'text', NULL, '36.0000', NULL),
(535, 1, 75, 'HVN1203', 'text', NULL, '0.0000', NULL),
(536, 2, 75, '704.55', 'text', NULL, '704.5500', NULL),
(537, 3, 75, '11', 'text', NULL, '11.0000', NULL),
(538, 1, 76, 'NPLPo6312', 'text', NULL, '0.0000', NULL),
(539, 2, 76, '1130.94', 'text', NULL, '1130.9400', NULL),
(540, 3, 76, '1', 'text', NULL, '1.0000', NULL),
(541, 1, 77, 'H8A1211', 'text', NULL, '0.0000', NULL),
(542, 2, 77, '1009.09', 'text', NULL, '1009.0900', NULL),
(543, 3, 77, '8', 'text', NULL, '8.0000', NULL),
(544, 1, 78, '0210043000', 'text', NULL, '210043000.0000', NULL),
(545, 2, 78, '445.45', 'text', NULL, '445.4500', NULL),
(546, 3, 78, '36', 'text', NULL, '36.0000', NULL),
(547, 1, 79, '1402', 'text', NULL, '1402.0000', NULL),
(548, 2, 79, '1468.18', 'text', NULL, '1468.1800', NULL),
(549, 3, 79, '1', 'text', NULL, '1.0000', NULL),
(550, 1, 80, 'NPLPo6438', 'text', NULL, '0.0000', NULL),
(551, 2, 80, '1142.84', 'text', NULL, '1142.8400', NULL),
(552, 3, 80, '1', 'text', NULL, '1.0000', NULL),
(553, 1, 81, 'NPLPo9523', 'text', NULL, '0.0000', NULL),
(554, 2, 81, '1283.31', 'text', NULL, '1283.3100', NULL),
(555, 3, 81, '1', 'text', NULL, '1.0000', NULL),
(556, 1, 82, 'SLMV56', 'text', NULL, '0.0000', NULL),
(557, 2, 82, '359.09', 'text', NULL, '359.0900', NULL),
(558, 3, 82, '1', 'text', NULL, '1.0000', NULL),
(559, 1, 83, 'NPLPo5621', 'text', NULL, '0.0000', NULL),
(560, 2, 83, '1345.22', 'text', NULL, '1345.2200', NULL),
(561, 3, 83, '1', 'text', NULL, '1.0000', NULL),
(562, 1, 84, 'NPLPo6426', 'text', NULL, '0.0000', NULL),
(563, 2, 84, '1059.51', 'text', NULL, '1059.5100', NULL),
(564, 3, 84, '1', 'text', NULL, '1.0000', NULL),
(565, 1, 85, 'AIR5', 'text', NULL, '0.0000', NULL),
(566, 2, 85, '68.18', 'text', NULL, '68.1800', NULL),
(567, 3, 85, '36', 'text', NULL, '36.0000', NULL),
(568, 1, 86, 'ACHM01', 'text', NULL, '0.0000', NULL),
(569, 2, 86, '381.82', 'text', NULL, '381.8200', NULL),
(570, 3, 86, '6', 'text', NULL, '6.0000', NULL),
(571, 1, 87, 'AIR11', 'text', NULL, '0.0000', NULL),
(572, 2, 87, '68.18', 'text', NULL, '68.1800', NULL),
(573, 3, 87, '36', 'text', NULL, '36.0000', NULL),
(574, 1, 88, 'NPLPo8548', 'text', NULL, '0.0000', NULL),
(575, 2, 88, '1309.5', 'text', NULL, '1309.5000', NULL),
(576, 3, 88, '1', 'text', NULL, '1.0000', NULL),
(577, 1, 89, 'AIR3', 'text', NULL, '0.0000', NULL),
(578, 2, 89, '68.18', 'text', NULL, '68.1800', NULL),
(579, 3, 89, '50', 'text', NULL, '50.0000', NULL),
(580, 1, 90, 'AIR15', 'text', NULL, '0.0000', NULL),
(581, 2, 90, '68.18', 'text', NULL, '68.1800', NULL),
(582, 3, 90, '36', 'text', NULL, '36.0000', NULL),
(583, 1, 91, 'NPLPo1209', 'text', NULL, '0.0000', NULL),
(584, 2, 91, '1427.36', 'text', NULL, '1427.3600', NULL),
(585, 3, 91, '1', 'text', NULL, '1.0000', NULL),
(586, 1, 92, '61501', 'text', NULL, '61501.0000', NULL),
(587, 2, 92, '1180', 'text', NULL, '1180.0000', NULL),
(588, 3, 92, '1', 'text', NULL, '1.0000', NULL),
(589, 1, 93, 'D38RU', 'text', NULL, '0.0000', NULL),
(590, 2, 93, '476.36', 'text', NULL, '476.3600', NULL),
(591, 3, 93, '50', 'text', NULL, '50.0000', NULL),
(592, 1, 94, 'NPLPo5948', 'text', NULL, '0.0000', NULL),
(593, 2, 94, '1369.03', 'text', NULL, '1369.0300', NULL),
(594, 3, 94, '1', 'text', NULL, '1.0000', NULL),
(595, 1, 95, 'SVOTIG0832', 'text', NULL, '0.0000', NULL),
(596, 2, 95, '1542.12', 'text', NULL, '1542.1200', NULL),
(597, 3, 95, '1', 'text', NULL, '1.0000', NULL),
(598, 1, 96, 'NPLPo0706', 'text', NULL, '0.0000', NULL),
(599, 2, 96, '1702.35', 'text', NULL, '1702.3500', NULL),
(600, 3, 96, '1', 'text', NULL, '1.0000', NULL),
(601, 1, 97, '25724', 'text', NULL, '25724.0000', NULL),
(602, 2, 97, '328.57', 'text', NULL, '328.5700', NULL),
(603, 3, 97, '3', 'text', NULL, '3.0000', NULL),
(604, 1, 98, '6320', 'text', NULL, '6320.0000', NULL),
(605, 2, 98, '45.45', 'text', NULL, '45.4500', NULL),
(606, 3, 98, '1', 'text', NULL, '1.0000', NULL),
(607, 1, 99, '25643', 'text', NULL, '25643.0000', NULL),
(608, 2, 99, '18.18', 'text', NULL, '18.1800', NULL),
(609, 3, 99, '50', 'text', NULL, '50.0000', NULL),
(610, 1, 100, 'NPLPO9550', 'text', NULL, '0.0000', NULL),
(611, 2, 100, '1285.69', 'text', NULL, '1285.6900', NULL),
(612, 3, 100, '1', 'text', NULL, '1.0000', NULL),
(613, 1, 101, 'NPLPo6310', 'text', NULL, '0.0000', NULL),
(614, 2, 101, '1190.45', 'text', NULL, '1190.4500', NULL),
(615, 3, 101, '1', 'text', NULL, '1.0000', NULL),
(616, 1, 102, 'NPLPo6171', 'text', NULL, '0.0000', NULL),
(617, 2, 102, '1309.5', 'text', NULL, '1309.5000', NULL),
(618, 3, 102, '1', 'text', NULL, '1.0000', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_element_right`
--

CREATE TABLE `b_iblock_element_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_fields`
--

CREATE TABLE `b_iblock_fields` (
  `IBLOCK_ID` int(18) NOT NULL,
  `FIELD_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_fields`
--

INSERT INTO `b_iblock_fields` (`IBLOCK_ID`, `FIELD_ID`, `IS_REQUIRED`, `DEFAULT_VALUE`) VALUES
(1, 'ACTIVE', 'Y', 'Y'),
(1, 'ACTIVE_FROM', 'N', ''),
(1, 'ACTIVE_TO', 'N', ''),
(1, 'CODE', 'Y', 'a:8:{s:6:\"UNIQUE\";s:1:\"Y\";s:15:\"TRANSLITERATION\";s:1:\"Y\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(1, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(1, 'DETAIL_TEXT', 'N', ''),
(1, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(1, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(1, 'IBLOCK_SECTION', 'N', 'a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}'),
(1, 'LOG_ELEMENT_ADD', 'Y', NULL),
(1, 'LOG_ELEMENT_DELETE', 'Y', NULL),
(1, 'LOG_ELEMENT_EDIT', 'Y', NULL),
(1, 'LOG_SECTION_ADD', 'Y', NULL),
(1, 'LOG_SECTION_DELETE', 'Y', NULL),
(1, 'LOG_SECTION_EDIT', 'Y', NULL),
(1, 'NAME', 'Y', ''),
(1, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(1, 'PREVIEW_TEXT', 'N', ''),
(1, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(1, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(1, 'SECTION_CODE', 'Y', 'a:8:{s:6:\"UNIQUE\";s:1:\"Y\";s:15:\"TRANSLITERATION\";s:1:\"Y\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(1, 'SECTION_DESCRIPTION', 'N', ''),
(1, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
(1, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(1, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(1, 'SECTION_NAME', 'Y', ''),
(1, 'SECTION_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(1, 'SECTION_XML_ID', 'N', ''),
(1, 'SORT', 'N', '0'),
(1, 'TAGS', 'N', ''),
(1, 'XML_ID', 'Y', ''),
(1, 'XML_IMPORT_START_TIME', 'N', NULL),
(2, 'ACTIVE', 'Y', 'Y'),
(2, 'ACTIVE_FROM', 'N', ''),
(2, 'ACTIVE_TO', 'N', ''),
(2, 'CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(2, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(2, 'DETAIL_TEXT', 'N', ''),
(2, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(2, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(2, 'IBLOCK_SECTION', 'N', 'a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}'),
(2, 'LOG_ELEMENT_ADD', 'Y', NULL),
(2, 'LOG_ELEMENT_DELETE', 'Y', NULL),
(2, 'LOG_ELEMENT_EDIT', 'Y', NULL),
(2, 'LOG_SECTION_ADD', 'Y', NULL),
(2, 'LOG_SECTION_DELETE', 'Y', NULL),
(2, 'LOG_SECTION_EDIT', 'Y', NULL),
(2, 'NAME', 'Y', ''),
(2, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(2, 'PREVIEW_TEXT', 'N', ''),
(2, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(2, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(2, 'SECTION_CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(2, 'SECTION_DESCRIPTION', 'N', ''),
(2, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
(2, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(2, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(2, 'SECTION_NAME', 'Y', ''),
(2, 'SECTION_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(2, 'SECTION_XML_ID', 'N', ''),
(2, 'SORT', 'N', '0'),
(2, 'TAGS', 'N', ''),
(2, 'XML_ID', 'Y', ''),
(2, 'XML_IMPORT_START_TIME', 'N', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_group`
--

CREATE TABLE `b_iblock_group` (
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `PERMISSION` char(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_group`
--

INSERT INTO `b_iblock_group` (`IBLOCK_ID`, `GROUP_ID`, `PERMISSION`) VALUES
(1, 1, 'X'),
(1, 2, 'R'),
(2, 1, 'X'),
(2, 2, 'R');

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_iblock_iprop`
--

CREATE TABLE `b_iblock_iblock_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_iproperty`
--

CREATE TABLE `b_iblock_iproperty` (
  `ID` int(11) NOT NULL,
  `IBLOCK_ID` int(11) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `TEMPLATE` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_messages`
--

CREATE TABLE `b_iblock_messages` (
  `IBLOCK_ID` int(18) NOT NULL,
  `MESSAGE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_TEXT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_messages`
--

INSERT INTO `b_iblock_messages` (`IBLOCK_ID`, `MESSAGE_ID`, `MESSAGE_TEXT`) VALUES
(1, 'ELEMENT_ADD', 'Добавить товар'),
(1, 'ELEMENT_DELETE', 'Удалить товар'),
(1, 'ELEMENT_EDIT', 'Изменить товар'),
(1, 'ELEMENT_NAME', 'Товар'),
(1, 'ELEMENTS_NAME', 'Товары'),
(1, 'SECTION_ADD', 'Добавить производителя'),
(1, 'SECTION_DELETE', 'Удалить производителя'),
(1, 'SECTION_EDIT', 'Изменить производителя'),
(1, 'SECTION_NAME', 'Производитель'),
(1, 'SECTIONS_NAME', 'Производители'),
(2, 'ELEMENT_ADD', 'Добавить элемент'),
(2, 'ELEMENT_DELETE', 'Удалить элемент'),
(2, 'ELEMENT_EDIT', 'Изменить элемент'),
(2, 'ELEMENT_NAME', 'Элемент'),
(2, 'ELEMENTS_NAME', 'Элементы'),
(2, 'SECTION_ADD', 'Добавить раздел'),
(2, 'SECTION_DELETE', 'Удалить раздел'),
(2, 'SECTION_EDIT', 'Изменить раздел'),
(2, 'SECTION_NAME', 'Раздел'),
(2, 'SECTIONS_NAME', 'Разделы');

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_offers_tmp`
--

CREATE TABLE `b_iblock_offers_tmp` (
  `ID` int(11) UNSIGNED NOT NULL,
  `PRODUCT_IBLOCK_ID` int(11) UNSIGNED NOT NULL,
  `OFFERS_IBLOCK_ID` int(11) UNSIGNED NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_property`
--

CREATE TABLE `b_iblock_property` (
  `ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IBLOCK_ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` text COLLATE utf8_unicode_ci,
  `PROPERTY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `ROW_COUNT` int(11) NOT NULL DEFAULT '1',
  `COL_COUNT` int(11) NOT NULL DEFAULT '30',
  `LIST_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'L',
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_TYPE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MULTIPLE_CNT` int(11) DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_IBLOCK_ID` int(18) DEFAULT NULL,
  `WITH_DESCRIPTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FILTRABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '1',
  `USER_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_SETTINGS` text COLLATE utf8_unicode_ci,
  `HINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_property`
--

INSERT INTO `b_iblock_property` (`ID`, `TIMESTAMP_X`, `IBLOCK_ID`, `NAME`, `ACTIVE`, `SORT`, `CODE`, `DEFAULT_VALUE`, `PROPERTY_TYPE`, `ROW_COUNT`, `COL_COUNT`, `LIST_TYPE`, `MULTIPLE`, `XML_ID`, `FILE_TYPE`, `MULTIPLE_CNT`, `TMP_ID`, `LINK_IBLOCK_ID`, `WITH_DESCRIPTION`, `SEARCHABLE`, `FILTRABLE`, `IS_REQUIRED`, `VERSION`, `USER_TYPE`, `USER_TYPE_SETTINGS`, `HINT`) VALUES
(1, '2017-08-17 15:37:49', 1, 'Артикул', 'Y', 100, 'articul', '', 'S', 1, 30, 'L', 'N', NULL, '', 5, NULL, 0, 'N', 'Y', 'N', 'Y', 1, NULL, NULL, ''),
(2, '2017-08-17 15:37:50', 1, 'Цена', 'Y', 300, 'price', '', 'N', 1, 30, 'L', 'N', NULL, '', 5, NULL, 0, 'N', 'N', 'N', 'Y', 1, NULL, NULL, ''),
(3, '2017-08-17 15:37:50', 1, 'Количество', 'Y', 200, 'count', '', 'N', 1, 30, 'L', 'N', NULL, '', 5, NULL, 0, 'N', 'N', 'N', 'Y', 1, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_property_enum`
--

CREATE TABLE `b_iblock_property_enum` (
  `ID` int(11) NOT NULL,
  `PROPERTY_ID` int(11) NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `XML_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_right`
--

CREATE TABLE `b_iblock_right` (
  `ID` int(11) NOT NULL,
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `DO_INHERIT` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `OP_SREAD` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `OP_EREAD` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_rss`
--

CREATE TABLE `b_iblock_rss` (
  `ID` int(11) NOT NULL,
  `IBLOCK_ID` int(11) NOT NULL,
  `NODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NODE_VALUE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_section`
--

CREATE TABLE `b_iblock_section` (
  `ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL,
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `GLOBAL_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `LEFT_MARGIN` int(18) DEFAULT NULL,
  `RIGHT_MARGIN` int(18) DEFAULT NULL,
  `DEPTH_LEVEL` int(18) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_section`
--

INSERT INTO `b_iblock_section` (`ID`, `TIMESTAMP_X`, `MODIFIED_BY`, `DATE_CREATE`, `CREATED_BY`, `IBLOCK_ID`, `IBLOCK_SECTION_ID`, `ACTIVE`, `GLOBAL_ACTIVE`, `SORT`, `NAME`, `PICTURE`, `LEFT_MARGIN`, `RIGHT_MARGIN`, `DEPTH_LEVEL`, `DESCRIPTION`, `DESCRIPTION_TYPE`, `SEARCHABLE_CONTENT`, `CODE`, `XML_ID`, `TMP_ID`, `DETAIL_PICTURE`, `SOCNET_GROUP_ID`) VALUES
(19, '2017-08-22 17:28:32', 1, '2017-08-22 21:08:22', 1, 1, NULL, 'Y', 'Y', 500, 'GATES', NULL, 19, 20, 1, '', 'text', 'GATES\r\n', 'gates', NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL),
(20, '2017-08-22 17:30:00', 1, '2017-08-22 21:08:22', 1, 1, NULL, 'Y', 'Y', 500, 'MMC', NULL, 21, 22, 1, '', 'text', 'MMC\r\n', 'mmc', NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL),
(21, '2017-08-22 17:33:23', 1, '2017-08-22 21:08:22', 1, 1, NULL, 'Y', 'Y', 500, 'TOYOTA', NULL, 39, 40, 1, '', 'text', 'TOYOTA\r\n', 'toyota', NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL),
(22, '2017-08-22 17:33:31', 1, '2017-08-22 21:08:22', 1, 1, NULL, 'Y', 'Y', 500, 'VERNET', NULL, 41, 42, 1, '', 'text', 'VERNET\r\n', 'vernet', NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL),
(23, '2017-08-22 17:33:40', 1, '2017-08-22 21:08:22', 1, 1, NULL, 'Y', 'Y', 500, 'DEPO', NULL, 13, 14, 1, '', 'text', 'DEPO\r\n', 'depo', NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL),
(24, '2017-08-22 17:33:48', 1, '2017-08-22 21:08:22', 1, 1, NULL, 'Y', 'Y', 500, 'NISSAN', NULL, 25, 26, 1, '', 'text', 'NISSAN\r\n', 'nissan', NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL),
(25, '2017-08-22 17:33:56', 1, '2017-08-22 21:08:22', 1, 1, NULL, 'Y', 'Y', 500, 'OCAP', NULL, 29, 30, 1, '', 'text', 'OCAP\r\n', 'ocap', NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL),
(26, '2017-08-22 17:34:13', 1, '2017-08-22 21:08:22', 1, 1, NULL, 'Y', 'Y', 500, 'OPEL', NULL, 31, 32, 1, '', 'text', 'OPEL\r\n', 'opel', NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL),
(27, '2017-08-22 17:34:22', 1, '2017-08-22 21:30:56', 1, 1, NULL, 'Y', 'Y', 500, 'FRAM', NULL, 17, 18, 1, '', 'text', 'FRAM\r\n', 'fram', NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL),
(28, '2017-08-22 17:34:32', 1, '2017-08-22 21:30:56', 1, 1, NULL, 'Y', 'Y', 500, 'BOSCH', NULL, 9, 10, 1, '', 'text', 'BOSCH\r\n', 'bosch', NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL),
(29, '2017-08-22 17:34:41', 1, '2017-08-22 21:30:56', 1, 1, NULL, 'Y', 'Y', 500, 'FEBI', NULL, 15, 16, 1, '', 'text', 'FEBI\r\n', 'febi', NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL),
(30, '2017-08-22 17:34:51', 1, '2017-08-22 21:30:56', 1, 1, NULL, 'Y', 'Y', 500, 'MTF Light', NULL, 23, 24, 1, '', 'text', 'MTF LIGHT\r\n', 'mtf-light', NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL),
(31, '2017-08-22 17:35:02', 1, '2017-08-22 21:30:56', 1, 1, NULL, 'Y', 'Y', 500, 'NORPLAST', NULL, 27, 28, 1, '', 'text', 'NORPLAST\r\n', 'norplast', NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL),
(32, '2017-08-22 17:35:12', 1, '2017-08-22 21:30:56', 1, 1, NULL, 'Y', 'Y', 500, 'SVS', NULL, 37, 38, 1, '', 'text', 'SVS\r\n', 'svs', NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL),
(33, '2017-08-22 17:35:21', 1, '2017-08-22 21:30:56', 1, 1, NULL, 'Y', 'Y', 500, 'ALFECO', NULL, 7, 8, 1, '', 'text', 'ALFECO\r\n', 'alfeco', NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL),
(34, '2017-08-22 17:35:31', 1, '2017-08-22 21:30:56', 1, 1, NULL, 'Y', 'Y', 500, 'SLIM', NULL, 35, 36, 1, '', 'text', 'SLIM\r\n', 'slim', NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL),
(35, '2017-08-22 17:35:52', 1, '2017-08-22 21:30:56', 1, 1, NULL, 'Y', 'Y', 500, 'AIR COUTURE', NULL, 3, 4, 1, '', 'text', 'AIR COUTURE\r\n', 'air-couture', NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL),
(36, '2017-08-22 17:36:10', 1, '2017-08-22 21:30:56', 1, 1, NULL, 'Y', 'Y', 500, 'AIRLINE', NULL, 5, 6, 1, '', 'text', 'AIRLINE\r\n', 'airline', NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL),
(37, '2017-08-22 17:36:19', 1, '2017-08-22 21:30:56', 1, 1, NULL, 'Y', 'Y', 500, 'AILERON', NULL, 1, 2, 1, '', 'text', 'AILERON\r\n', 'aileron', NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL),
(38, '2017-08-22 17:36:28', 1, '2017-08-22 21:30:56', 1, 1, NULL, 'Y', 'Y', 500, 'CARMATE', NULL, 11, 12, 1, '', 'text', 'CARMATE\r\n', 'carmate', NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL),
(39, '2017-08-22 17:36:37', 1, '2017-08-22 21:30:56', 1, 1, NULL, 'Y', 'Y', 500, 'SIM', NULL, 33, 34, 1, '', 'text', 'SIM\r\n', 'sim', NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL),
(41, '2017-08-22 17:37:10', 1, '2017-08-22 21:50:54', 1, 1, NULL, 'Y', 'Y', 500, 'РОССИЯ', NULL, 47, 48, 1, '', 'text', 'РОССИЯ\r\n', 'rossiya', NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL),
(42, '2017-08-22 17:37:19', 1, '2017-08-22 21:50:54', 1, 1, NULL, 'Y', 'Y', 500, 'ЗЕБРА', NULL, 45, 46, 1, '', 'text', 'ЗЕБРА\r\n', 'zebra', NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL),
(43, '2017-08-22 17:37:29', 1, '2017-08-22 21:50:54', 1, 1, NULL, 'Y', 'Y', 500, 'ДиаЛУЧ', NULL, 43, 44, 1, '', 'text', 'ДИАЛУЧ\r\n', 'dialuch', NULL, 'b369e75c72765cbe60bd6fea93762042', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_section_element`
--

CREATE TABLE `b_iblock_section_element` (
  `IBLOCK_SECTION_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `ADDITIONAL_PROPERTY_ID` int(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_section_element`
--

INSERT INTO `b_iblock_section_element` (`IBLOCK_SECTION_ID`, `IBLOCK_ELEMENT_ID`, `ADDITIONAL_PROPERTY_ID`) VALUES
(19, 4, NULL),
(19, 5, NULL),
(19, 6, NULL),
(19, 7, NULL),
(19, 8, NULL),
(19, 9, NULL),
(19, 10, NULL),
(19, 14, NULL),
(19, 15, NULL),
(19, 16, NULL),
(20, 11, NULL),
(20, 12, NULL),
(20, 19, NULL),
(20, 22, NULL),
(20, 23, NULL),
(20, 24, NULL),
(20, 25, NULL),
(20, 31, NULL),
(20, 36, NULL),
(20, 37, NULL),
(20, 38, NULL),
(20, 51, NULL),
(20, 52, NULL),
(20, 53, NULL),
(20, 54, NULL),
(20, 55, NULL),
(20, 56, NULL),
(20, 57, NULL),
(20, 58, NULL),
(20, 59, NULL),
(20, 64, NULL),
(20, 65, NULL),
(20, 66, NULL),
(20, 67, NULL),
(20, 72, NULL),
(20, 73, NULL),
(21, 13, NULL),
(21, 20, NULL),
(21, 21, NULL),
(21, 28, NULL),
(21, 29, NULL),
(21, 30, NULL),
(21, 33, NULL),
(21, 34, NULL),
(21, 35, NULL),
(21, 43, NULL),
(21, 44, NULL),
(21, 45, NULL),
(21, 46, NULL),
(21, 47, NULL),
(21, 48, NULL),
(21, 49, NULL),
(21, 50, NULL),
(21, 61, NULL),
(21, 62, NULL),
(21, 74, NULL),
(22, 17, NULL),
(23, 18, NULL),
(24, 26, NULL),
(24, 27, NULL),
(24, 32, NULL),
(24, 39, NULL),
(24, 40, NULL),
(24, 41, NULL),
(24, 42, NULL),
(25, 60, NULL),
(26, 63, NULL),
(27, 68, NULL),
(27, 69, NULL),
(28, 70, NULL),
(29, 71, NULL),
(30, 75, NULL),
(30, 77, NULL),
(31, 76, NULL),
(31, 80, NULL),
(31, 81, NULL),
(31, 83, NULL),
(31, 84, NULL),
(31, 88, NULL),
(31, 91, NULL),
(31, 94, NULL),
(31, 96, NULL),
(31, 100, NULL),
(31, 101, NULL),
(31, 102, NULL),
(32, 78, NULL),
(33, 79, NULL),
(34, 82, NULL),
(35, 85, NULL),
(35, 87, NULL),
(35, 89, NULL),
(35, 90, NULL),
(36, 86, NULL),
(37, 92, NULL),
(38, 93, NULL),
(39, 95, NULL),
(41, 97, NULL),
(42, 98, NULL),
(43, 99, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_section_iprop`
--

CREATE TABLE `b_iblock_section_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_section_property`
--

CREATE TABLE `b_iblock_section_property` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `PROPERTY_ID` int(11) NOT NULL,
  `SMART_FILTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_EXPANDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_HINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_section_right`
--

CREATE TABLE `b_iblock_section_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_sequence`
--

CREATE TABLE `b_iblock_sequence` (
  `IBLOCK_ID` int(18) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SEQ_VALUE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_site`
--

CREATE TABLE `b_iblock_site` (
  `IBLOCK_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_site`
--

INSERT INTO `b_iblock_site` (`IBLOCK_ID`, `SITE_ID`) VALUES
(1, 's1'),
(2, 's1');

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_type`
--

CREATE TABLE `b_iblock_type` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_RSS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(18) NOT NULL DEFAULT '500'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_type`
--

INSERT INTO `b_iblock_type` (`ID`, `SECTIONS`, `EDIT_FILE_BEFORE`, `EDIT_FILE_AFTER`, `IN_RSS`, `SORT`) VALUES
('catalog', 'Y', '', '', 'N', 500),
('news', 'Y', '', '', 'N', 500);

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_type_lang`
--

CREATE TABLE `b_iblock_type_lang` (
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_type_lang`
--

INSERT INTO `b_iblock_type_lang` (`IBLOCK_TYPE_ID`, `LID`, `NAME`, `SECTION_NAME`, `ELEMENT_NAME`) VALUES
('catalog', 'ru', 'Каталог', 'Производитель', 'Товар'),
('catalog', 'en', 'catalog', 'Manufacturer', 'Product'),
('news', 'ru', 'Новости', '', ''),
('news', 'en', 'news', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_lang`
--

CREATE TABLE `b_lang` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DIR` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOC_ROOT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOMAIN_LIMITED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SERVER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_lang`
--

INSERT INTO `b_lang` (`LID`, `SORT`, `DEF`, `ACTIVE`, `NAME`, `DIR`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `LANGUAGE_ID`, `DOC_ROOT`, `DOMAIN_LIMITED`, `SERVER_NAME`, `SITE_NAME`, `EMAIL`, `CULTURE_ID`) VALUES
('s1', 1, 'Y', 'Y', 'Автомир45', '/', NULL, NULL, NULL, NULL, NULL, 'ru', '', 'Y', 'avtomir45.ru', 'АВТОМИР45', '', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `b_lang_domain`
--

CREATE TABLE `b_lang_domain` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_lang_domain`
--

INSERT INTO `b_lang_domain` (`LID`, `DOMAIN`) VALUES
('s1', 'avtomir45.ru');

-- --------------------------------------------------------

--
-- Структура таблицы `b_language`
--

CREATE TABLE `b_language` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_language`
--

INSERT INTO `b_language` (`LID`, `SORT`, `DEF`, `ACTIVE`, `NAME`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `DIRECTION`, `CULTURE_ID`) VALUES
('en', 2, 'N', 'Y', 'English', NULL, NULL, NULL, NULL, NULL, NULL, 2),
('ru', 1, 'Y', 'Y', 'Russian', NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `b_medialib_collection`
--

CREATE TABLE `b_medialib_collection` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DATE_UPDATE` datetime NOT NULL,
  `OWNER_ID` int(11) DEFAULT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEMS_COUNT` int(11) DEFAULT NULL,
  `ML_TYPE` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_medialib_collection_item`
--

CREATE TABLE `b_medialib_collection_item` (
  `COLLECTION_ID` int(11) NOT NULL,
  `ITEM_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_medialib_item`
--

CREATE TABLE `b_medialib_item` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_TYPE` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `SOURCE_ID` int(11) NOT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_medialib_type`
--

CREATE TABLE `b_medialib_type` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DESCRIPTION` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_medialib_type`
--

INSERT INTO `b_medialib_type` (`ID`, `NAME`, `CODE`, `EXT`, `SYSTEM`, `DESCRIPTION`) VALUES
(1, 'image_name', 'image', 'jpg,jpeg,gif,png', 'Y', 'image_desc'),
(2, 'video_name', 'video', 'flv,mp4,wmv', 'Y', 'video_desc'),
(3, 'sound_name', 'sound', 'mp3,wma,aac', 'Y', 'sound_desc');

-- --------------------------------------------------------

--
-- Структура таблицы `b_module`
--

CREATE TABLE `b_module` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_ACTIVE` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_module`
--

INSERT INTO `b_module` (`ID`, `DATE_ACTIVE`) VALUES
('bitrix.sitecorporate', NULL),
('bitrixcloud', NULL),
('clouds', NULL),
('compression', NULL),
('fileman', NULL),
('highloadblock', NULL),
('iblock', NULL),
('main', NULL),
('perfmon', NULL),
('search', NULL),
('seo', NULL),
('socialservices', NULL),
('translate', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_module_group`
--

CREATE TABLE `b_module_group` (
  `ID` int(11) NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `G_ACCESS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_module_to_module`
--

CREATE TABLE `b_module_to_module` (
  `ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `FROM_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TO_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TO_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_CLASS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD_ARG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_module_to_module`
--

INSERT INTO `b_module_to_module` (`ID`, `TIMESTAMP_X`, `SORT`, `FROM_MODULE_ID`, `MESSAGE_ID`, `TO_MODULE_ID`, `TO_PATH`, `TO_CLASS`, `TO_METHOD`, `TO_METHOD_ARG`, `VERSION`) VALUES
(1, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'main', '/modules/main/tools/prop_userid.php', 'CIBlockPropertyUserID', 'GetUserTypeDescription', '', 1),
(2, NULL, 100, 'main', 'OnUserDelete', 'main', '/modules/main/classes/mysql/favorites.php', 'CFavorites', 'OnUserDelete', '', 1),
(3, NULL, 100, 'main', 'OnLanguageDelete', 'main', '/modules/main/classes/mysql/favorites.php', 'CFavorites', 'OnLanguageDelete', '', 1),
(4, NULL, 100, 'main', 'OnUserDelete', 'main', '', 'CUserOptions', 'OnUserDelete', '', 1),
(5, NULL, 100, 'main', 'OnChangeFile', 'main', '', 'CMain', 'OnChangeFileComponent', '', 1),
(6, NULL, 100, 'main', 'OnUserTypeRightsCheck', 'main', '', 'CUser', 'UserTypeRightsCheck', '', 1),
(7, NULL, 100, 'main', 'OnUserLogin', 'main', '', 'UpdateTools', 'CheckUpdates', '', 1),
(8, NULL, 100, 'main', 'OnModuleUpdate', 'main', '', 'UpdateTools', 'SetUpdateResult', '', 1),
(9, NULL, 100, 'main', 'OnUpdateCheck', 'main', '', 'UpdateTools', 'SetUpdateError', '', 1),
(10, NULL, 100, 'main', 'OnPanelCreate', 'main', '', 'CUndo', 'CheckNotifyMessage', '', 1),
(11, NULL, 100, 'main', 'OnAfterAddRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterAddRating', '', 1),
(12, NULL, 100, 'main', 'OnAfterUpdateRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterUpdateRating', '', 1),
(13, NULL, 100, 'main', 'OnSetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnSetRatingConfigs', '', 1),
(14, NULL, 100, 'main', 'OnGetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingConfigs', '', 1),
(15, NULL, 100, 'main', 'OnGetRatingsObjects', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingObject', '', 1),
(16, NULL, 100, 'main', 'OnGetRatingContentOwner', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingContentOwner', '', 1),
(17, NULL, 100, 'main', 'OnAfterAddRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterAddRatingRule', '', 1),
(18, NULL, 100, 'main', 'OnAfterUpdateRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterUpdateRatingRule', '', 1),
(19, NULL, 100, 'main', 'OnGetRatingRuleObjects', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleObjects', '', 1),
(20, NULL, 100, 'main', 'OnGetRatingRuleConfigs', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleConfigs', '', 1),
(21, NULL, 100, 'main', 'OnAfterUserAdd', 'main', '', 'CRatings', 'OnAfterUserRegister', '', 1),
(22, NULL, 100, 'main', 'OnUserDelete', 'main', '', 'CRatings', 'OnUserDelete', '', 1),
(23, NULL, 100, 'main', 'OnUserDelete', 'main', '', 'CAccess', 'OnUserDelete', '', 1),
(24, NULL, 100, 'main', 'OnAfterGroupAdd', 'main', '', 'CGroupAuthProvider', 'OnAfterGroupAdd', '', 1),
(25, NULL, 100, 'main', 'OnBeforeGroupUpdate', 'main', '', 'CGroupAuthProvider', 'OnBeforeGroupUpdate', '', 1),
(26, NULL, 100, 'main', 'OnBeforeGroupDelete', 'main', '', 'CGroupAuthProvider', 'OnBeforeGroupDelete', '', 1),
(27, NULL, 100, 'main', 'OnAfterSetUserGroup', 'main', '', 'CGroupAuthProvider', 'OnAfterSetUserGroup', '', 1),
(28, NULL, 100, 'main', 'OnUserLogin', 'main', '', 'CGroupAuthProvider', 'OnUserLogin', '', 1),
(29, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'main', '', 'CEventMain', 'GetAuditTypes', '', 1),
(30, NULL, 100, 'main', 'OnEventLogGetAuditHandlers', 'main', '', 'CEventMain', 'MakeMainObject', '', 1),
(31, NULL, 100, 'perfmon', 'OnGetTableSchema', 'main', '', 'CTableSchema', 'OnGetTableSchema', '', 1),
(32, NULL, 100, 'sender', 'OnConnectorList', 'main', '', '\\Bitrix\\Main\\SenderEventHandler', 'onConnectorListUser', '', 1),
(33, NULL, 110, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeString', 'GetUserTypeDescription', '', 1),
(34, NULL, 120, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeInteger', 'GetUserTypeDescription', '', 1),
(35, NULL, 130, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDouble', 'GetUserTypeDescription', '', 1),
(36, NULL, 140, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDateTime', 'GetUserTypeDescription', '', 1),
(37, NULL, 145, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDate', 'GetUserTypeDescription', '', 1),
(38, NULL, 150, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeBoolean', 'GetUserTypeDescription', '', 1),
(39, NULL, 160, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeFile', 'GetUserTypeDescription', '', 1),
(40, NULL, 170, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeEnum', 'GetUserTypeDescription', '', 1),
(41, NULL, 180, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockSection', 'GetUserTypeDescription', '', 1),
(42, NULL, 190, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockElement', 'GetUserTypeDescription', '', 1),
(43, NULL, 200, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeStringFormatted', 'GetUserTypeDescription', '', 1),
(44, NULL, 210, 'main', 'OnUserTypeBuildList', 'main', '', '\\Bitrix\\Main\\UrlPreview\\UrlPreviewUserType', 'getUserTypeDescription', '', 1),
(45, NULL, 100, 'main', 'OnBeforeEndBufferContent', 'main', '', '\\Bitrix\\Main\\Analytics\\Counter', 'onBeforeEndBufferContent', '', 1),
(46, NULL, 100, 'main', 'OnBeforeRestartBuffer', 'main', '', '\\Bitrix\\Main\\Analytics\\Counter', 'onBeforeRestartBuffer', '', 1),
(47, NULL, 100, 'disk', 'onAfterAjaxActionCreateFolderWithSharing', 'main', '', '\\Bitrix\\Main\\FinderDestTable', 'onAfterDiskAjaxAction', '', 1),
(48, NULL, 100, 'disk', 'onAfterAjaxActionAppendSharing', 'main', '', '\\Bitrix\\Main\\FinderDestTable', 'onAfterDiskAjaxAction', '', 1),
(49, NULL, 100, 'disk', 'onAfterAjaxActionChangeSharingAndRights', 'main', '', '\\Bitrix\\Main\\FinderDestTable', 'onAfterDiskAjaxAction', '', 1),
(50, NULL, 100, 'socialnetwork', 'OnSocNetLogDelete', 'main', '', 'CUserCounter', 'OnSocNetLogDelete', '', 1),
(51, NULL, 100, 'socialnetwork', 'OnSocNetLogCommentDelete', 'main', '', 'CUserCounter', 'OnSocNetLogCommentDelete', '', 1),
(52, NULL, 100, 'sale', 'OnSaleBasketItemSaved', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogBasket', '', 2),
(53, NULL, 100, 'sale', 'OnSaleOrderSaved', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogOrder', '', 2),
(54, NULL, 100, 'sale', 'OnSaleOrderPaid', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogOrderPayment', '', 2),
(55, NULL, 100, 'main', 'OnBuildGlobalMenu', 'b24connector', '', '\\Bitrix\\B24Connector\\Helper', 'onBuildGlobalMenu', '', 1),
(56, NULL, 100, 'main', 'OnBeforeProlog', 'b24connector', '', '\\Bitrix\\B24Connector\\Helper', 'onBeforeProlog', '', 1),
(57, NULL, 100, 'main', 'OnBeforeProlog', 'bitrix.sitecorporate', '', 'CSiteCorporate', 'ShowPanel', '', 1),
(58, NULL, 100, 'main', 'OnAdminInformerInsertItems', 'bitrixcloud', '', 'CBitrixCloudCDN', 'OnAdminInformerInsertItems', '', 1),
(59, NULL, 100, 'main', 'OnAdminInformerInsertItems', 'bitrixcloud', '', 'CBitrixCloudBackup', 'OnAdminInformerInsertItems', '', 1),
(60, NULL, 100, 'mobileapp', 'OnBeforeAdminMobileMenuBuild', 'bitrixcloud', '', 'CBitrixCloudMobile', 'OnBeforeAdminMobileMenuBuild', '', 1),
(61, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'clouds', '', 'CCloudStorage', 'GetAuditTypes', '', 1),
(62, NULL, 100, 'main', 'OnBeforeProlog', 'clouds', '', 'CCloudStorage', 'OnBeforeProlog', '', 1),
(63, NULL, 100, 'main', 'OnAdminListDisplay', 'clouds', '', 'CCloudStorage', 'OnAdminListDisplay', '', 1),
(64, NULL, 100, 'main', 'OnBuildGlobalMenu', 'clouds', '', 'CCloudStorage', 'OnBuildGlobalMenu', '', 1),
(65, NULL, 100, 'main', 'OnFileSave', 'clouds', '', 'CCloudStorage', 'OnFileSave', '', 1),
(66, NULL, 100, 'main', 'OnGetFileSRC', 'clouds', '', 'CCloudStorage', 'OnGetFileSRC', '', 1),
(67, NULL, 100, 'main', 'OnFileCopy', 'clouds', '', 'CCloudStorage', 'OnFileCopy', '', 1),
(68, NULL, 100, 'main', 'OnFileDelete', 'clouds', '', 'CCloudStorage', 'OnFileDelete', '', 1),
(69, NULL, 100, 'main', 'OnMakeFileArray', 'clouds', '', 'CCloudStorage', 'OnMakeFileArray', '', 1),
(70, NULL, 100, 'main', 'OnBeforeResizeImage', 'clouds', '', 'CCloudStorage', 'OnBeforeResizeImage', '', 1),
(71, NULL, 100, 'main', 'OnAfterResizeImage', 'clouds', '', 'CCloudStorage', 'OnAfterResizeImage', '', 1),
(72, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_AmazonS3', 'GetObjectInstance', '', 1),
(73, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_GoogleStorage', 'GetObjectInstance', '', 1),
(74, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_OpenStackStorage', 'GetObjectInstance', '', 1),
(75, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_RackSpaceCloudFiles', 'GetObjectInstance', '', 1),
(76, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_ClodoRU', 'GetObjectInstance', '', 1),
(77, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_Selectel', 'GetObjectInstance', '', 1),
(78, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_HotBox', 'GetObjectInstance', '', 1),
(79, NULL, 1, 'main', 'OnPageStart', 'compression', '', 'CCompress', 'OnPageStart', '', 1),
(80, NULL, 10000, 'main', 'OnAfterEpilog', 'compression', '', 'CCompress', 'OnAfterEpilog', '', 1),
(81, NULL, 100, 'main', 'OnGroupDelete', 'fileman', '', 'CFileman', 'OnGroupDelete', '', 1),
(82, NULL, 100, 'main', 'OnPanelCreate', 'fileman', '', 'CFileman', 'OnPanelCreate', '', 1),
(83, NULL, 100, 'main', 'OnModuleUpdate', 'fileman', '', 'CFileman', 'OnModuleUpdate', '', 1),
(84, NULL, 100, 'main', 'OnModuleInstalled', 'fileman', '', 'CFileman', 'ClearComponentsListCache', '', 1),
(85, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapGoogle', 'GetUserTypeDescription', '', 1),
(86, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapYandex', 'GetUserTypeDescription', '', 1),
(87, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyVideo', 'GetUserTypeDescription', '', 1),
(88, NULL, 100, 'main', 'OnUserTypeBuildList', 'fileman', '', 'CUserTypeVideo', 'GetUserTypeDescription', '', 1),
(89, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'fileman', '', 'CEventFileman', 'GetAuditTypes', '', 1),
(90, NULL, 100, 'main', 'OnEventLogGetAuditHandlers', 'fileman', '', 'CEventFileman', 'MakeFilemanObject', '', 1),
(91, NULL, 100, 'main', 'OnBeforeUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeAdd', '', 1),
(92, NULL, 100, 'main', 'OnAfterUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'onAfterUserTypeAdd', '', 1),
(93, NULL, 100, 'main', 'OnBeforeUserTypeDelete', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeDelete', '', 1),
(94, NULL, 100, 'main', 'OnUserTypeBuildList', 'highloadblock', '', 'CUserTypeHlblock', 'GetUserTypeDescription', '', 1),
(95, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'highloadblock', '', 'CIBlockPropertyDirectory', 'GetUserTypeDescription', '', 1),
(96, NULL, 100, 'main', 'OnGroupDelete', 'iblock', '', 'CIBlock', 'OnGroupDelete', '', 1),
(97, NULL, 100, 'main', 'OnBeforeLangDelete', 'iblock', '', 'CIBlock', 'OnBeforeLangDelete', '', 1),
(98, NULL, 100, 'main', 'OnLangDelete', 'iblock', '', 'CIBlock', 'OnLangDelete', '', 1),
(99, NULL, 100, 'main', 'OnUserTypeRightsCheck', 'iblock', '', 'CIBlockSection', 'UserTypeRightsCheck', '', 1),
(100, NULL, 100, 'search', 'OnReindex', 'iblock', '', 'CIBlock', 'OnSearchReindex', '', 1),
(101, NULL, 100, 'search', 'OnSearchGetURL', 'iblock', '', 'CIBlock', 'OnSearchGetURL', '', 1),
(102, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'iblock', '', 'CIBlock', 'GetAuditTypes', '', 1),
(103, NULL, 100, 'main', 'OnEventLogGetAuditHandlers', 'iblock', '', 'CEventIBlock', 'MakeIBlockObject', '', 1),
(104, NULL, 200, 'main', 'OnGetRatingContentOwner', 'iblock', '', 'CRatingsComponentsIBlock', 'OnGetRatingContentOwner', '', 1),
(105, NULL, 100, 'main', 'OnTaskOperationsChanged', 'iblock', '', 'CIBlockRightsStorage', 'OnTaskOperationsChanged', '', 1),
(106, NULL, 100, 'main', 'OnGroupDelete', 'iblock', '', 'CIBlockRightsStorage', 'OnGroupDelete', '', 1),
(107, NULL, 100, 'main', 'OnUserDelete', 'iblock', '', 'CIBlockRightsStorage', 'OnUserDelete', '', 1),
(108, NULL, 100, 'perfmon', 'OnGetTableSchema', 'iblock', '', 'iblock', 'OnGetTableSchema', '', 1),
(109, NULL, 100, 'sender', 'OnConnectorList', 'iblock', '', '\\Bitrix\\Iblock\\SenderEventHandler', 'onConnectorListIblock', '', 1),
(110, NULL, 10, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyDate', 'GetUserTypeDescription', '', 1),
(111, NULL, 20, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyDateTime', 'GetUserTypeDescription', '', 1),
(112, NULL, 30, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyXmlID', 'GetUserTypeDescription', '', 1),
(113, NULL, 40, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyFileMan', 'GetUserTypeDescription', '', 1),
(114, NULL, 50, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyHTML', 'GetUserTypeDescription', '', 1),
(115, NULL, 60, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyElementList', 'GetUserTypeDescription', '', 1),
(116, NULL, 70, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySequence', 'GetUserTypeDescription', '', 1),
(117, NULL, 80, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyElementAutoComplete', 'GetUserTypeDescription', '', 1),
(118, NULL, 90, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySKU', 'GetUserTypeDescription', '', 1),
(119, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySectionAutoComplete', 'GetUserTypeDescription', '', 1),
(120, NULL, 100, 'perfmon', 'OnGetTableSchema', 'perfmon', '', 'perfmon', 'OnGetTableSchema', '', 1),
(121, NULL, 100, 'main', 'OnChangePermissions', 'search', '', 'CSearch', 'OnChangeFilePermissions', '', 1),
(122, NULL, 100, 'main', 'OnChangeFile', 'search', '', 'CSearch', 'OnChangeFile', '', 1),
(123, NULL, 100, 'main', 'OnGroupDelete', 'search', '', 'CSearch', 'OnGroupDelete', '', 1),
(124, NULL, 100, 'main', 'OnLangDelete', 'search', '', 'CSearch', 'OnLangDelete', '', 1),
(125, NULL, 100, 'main', 'OnAfterUserUpdate', 'search', '', 'CSearchUser', 'OnAfterUserUpdate', '', 1),
(126, NULL, 100, 'main', 'OnUserDelete', 'search', '', 'CSearchUser', 'DeleteByUserID', '', 1),
(127, NULL, 100, 'cluster', 'OnGetTableList', 'search', '', 'search', 'OnGetTableList', '', 1),
(128, NULL, 100, 'perfmon', 'OnGetTableSchema', 'search', '', 'search', 'OnGetTableSchema', '', 1),
(129, NULL, 90, 'main', 'OnEpilog', 'search', '', 'CSearchStatistic', 'OnEpilog', '', 1),
(130, NULL, 100, 'main', 'OnPanelCreate', 'seo', '', 'CSeoEventHandlers', 'SeoOnPanelCreate', '', 2),
(131, NULL, 100, 'fileman', 'OnIncludeHTMLEditorScript', 'seo', '', 'CSeoEventHandlers', 'OnIncludeHTMLEditorScript', '', 2),
(132, NULL, 100, 'fileman', 'OnBeforeHTMLEditorScriptRuns', 'seo', '', 'CSeoEventHandlers', 'OnBeforeHTMLEditorScriptRuns', '', 2),
(133, NULL, 100, 'iblock', 'OnAfterIBlockSectionAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'addSection', '', 2),
(134, NULL, 100, 'iblock', 'OnAfterIBlockElementAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'addElement', '', 2),
(135, NULL, 100, 'iblock', 'OnBeforeIBlockSectionDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeDeleteSection', '', 2),
(136, NULL, 100, 'iblock', 'OnBeforeIBlockElementDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeDeleteElement', '', 2),
(137, NULL, 100, 'iblock', 'OnAfterIBlockSectionDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'deleteSection', '', 2),
(138, NULL, 100, 'iblock', 'OnAfterIBlockElementDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'deleteElement', '', 2),
(139, NULL, 100, 'iblock', 'OnBeforeIBlockSectionUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeUpdateSection', '', 2),
(140, NULL, 100, 'iblock', 'OnBeforeIBlockElementUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeUpdateElement', '', 2),
(141, NULL, 100, 'iblock', 'OnAfterIBlockSectionUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'updateSection', '', 2),
(142, NULL, 100, 'iblock', 'OnAfterIBlockElementUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'updateElement', '', 2),
(143, NULL, 100, 'forum', 'onAfterTopicAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'addTopic', '', 2),
(144, NULL, 100, 'forum', 'onAfterTopicUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'updateTopic', '', 2),
(145, NULL, 100, 'forum', 'onAfterTopicDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'deleteTopic', '', 2),
(146, NULL, 100, 'main', 'OnAdminIBlockElementEdit', 'seo', '', '\\Bitrix\\Seo\\AdvTabEngine', 'eventHandler', '', 2),
(147, NULL, 100, 'main', 'OnBeforeProlog', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'checkSession', '', 2),
(148, NULL, 100, 'sale', 'OnOrderSave', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onOrderSave', '', 2),
(149, NULL, 100, 'sale', 'OnBasketOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onBasketOrder', '', 2),
(150, NULL, 100, 'sale', 'onSalePayOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSalePayOrder', '', 2),
(151, NULL, 100, 'sale', 'onSaleDeductOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleDeductOrder', '', 2),
(152, NULL, 100, 'sale', 'onSaleDeliveryOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleDeliveryOrder', '', 2),
(153, NULL, 100, 'sale', 'onSaleStatusOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleStatusOrder', '', 2),
(154, NULL, 100, 'conversion', 'OnSetDayContextAttributes', 'seo', '', '\\Bitrix\\Seo\\ConversionHandler', 'onSetDayContextAttributes', '', 2),
(155, NULL, 100, 'conversion', 'OnGetAttributeTypes', 'seo', '', '\\Bitrix\\Seo\\ConversionHandler', 'onGetAttributeTypes', '', 2),
(156, NULL, 100, 'catalog', 'OnProductUpdate', 'seo', '', '\\Bitrix\\Seo\\Adv\\Auto', 'checkQuantity', '', 2),
(157, NULL, 100, 'catalog', 'OnProductSetAvailableUpdate', 'seo', '', '\\Bitrix\\Seo\\Adv\\Auto', 'checkQuantity', '', 2),
(158, NULL, 100, 'main', 'OnUserDelete', 'socialservices', '', 'CSocServAuthDB', 'OnUserDelete', '', 1),
(159, NULL, 100, 'timeman', 'OnAfterTMReportDailyAdd', 'socialservices', '', 'CSocServAuthDB', 'OnAfterTMReportDailyAdd', '', 1),
(160, NULL, 100, 'timeman', 'OnAfterTMDayStart', 'socialservices', '', 'CSocServAuthDB', 'OnAfterTMDayStart', '', 1),
(161, NULL, 100, 'timeman', 'OnTimeManShow', 'socialservices', '', 'CSocServEventHandlers', 'OnTimeManShow', '', 1),
(162, NULL, 100, 'main', 'OnFindExternalUser', 'socialservices', '', 'CSocServAuthDB', 'OnFindExternalUser', '', 1),
(163, NULL, 100, 'socialservices', 'OnFindSocialservicesUser', 'socialservices', '', 'CSocServAuthManager', 'checkOldUser', '', 1),
(164, NULL, 100, 'socialservices', 'OnFindSocialservicesUser', 'socialservices', '', 'CSocServAuthManager', 'checkAbandonedUser', '', 1),
(165, NULL, 100, 'main', 'OnPanelCreate', 'translate', '', 'CTranslateEventHandlers', 'TranslatOnPanelCreate', '', 1),
(166, NULL, 100, 'main', 'OnBeforeProlog', 'main', '/modules/main/install/wizard_sol/panel_button.php', 'CWizardSolPanel', 'ShowPanel', '', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `b_operation`
--

CREATE TABLE `b_operation` (
  `ID` int(18) NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_operation`
--

INSERT INTO `b_operation` (`ID`, `NAME`, `MODULE_ID`, `DESCRIPTION`, `BINDING`) VALUES
(1, 'edit_php', 'main', NULL, 'module'),
(2, 'view_own_profile', 'main', NULL, 'module'),
(3, 'edit_own_profile', 'main', NULL, 'module'),
(4, 'view_all_users', 'main', NULL, 'module'),
(5, 'view_groups', 'main', NULL, 'module'),
(6, 'view_tasks', 'main', NULL, 'module'),
(7, 'view_other_settings', 'main', NULL, 'module'),
(8, 'view_subordinate_users', 'main', NULL, 'module'),
(9, 'edit_subordinate_users', 'main', NULL, 'module'),
(10, 'edit_all_users', 'main', NULL, 'module'),
(11, 'edit_groups', 'main', NULL, 'module'),
(12, 'edit_tasks', 'main', NULL, 'module'),
(13, 'edit_other_settings', 'main', NULL, 'module'),
(14, 'cache_control', 'main', NULL, 'module'),
(15, 'lpa_template_edit', 'main', NULL, 'module'),
(16, 'view_event_log', 'main', NULL, 'module'),
(17, 'edit_ratings', 'main', NULL, 'module'),
(18, 'manage_short_uri', 'main', NULL, 'module'),
(19, 'fm_view_permission', 'main', NULL, 'file'),
(20, 'fm_view_file', 'main', NULL, 'file'),
(21, 'fm_view_listing', 'main', NULL, 'file'),
(22, 'fm_edit_existent_folder', 'main', NULL, 'file'),
(23, 'fm_create_new_file', 'main', NULL, 'file'),
(24, 'fm_edit_existent_file', 'main', NULL, 'file'),
(25, 'fm_create_new_folder', 'main', NULL, 'file'),
(26, 'fm_delete_file', 'main', NULL, 'file'),
(27, 'fm_delete_folder', 'main', NULL, 'file'),
(28, 'fm_edit_in_workflow', 'main', NULL, 'file'),
(29, 'fm_rename_file', 'main', NULL, 'file'),
(30, 'fm_rename_folder', 'main', NULL, 'file'),
(31, 'fm_upload_file', 'main', NULL, 'file'),
(32, 'fm_add_to_menu', 'main', NULL, 'file'),
(33, 'fm_download_file', 'main', NULL, 'file'),
(34, 'fm_lpa', 'main', NULL, 'file'),
(35, 'fm_edit_permission', 'main', NULL, 'file'),
(36, 'bitrixcloud_monitoring', 'bitrixcloud', NULL, 'module'),
(37, 'bitrixcloud_backup', 'bitrixcloud', NULL, 'module'),
(38, 'bitrixcloud_cdn', 'bitrixcloud', NULL, 'module'),
(39, 'clouds_browse', 'clouds', NULL, 'module'),
(40, 'clouds_upload', 'clouds', NULL, 'module'),
(41, 'clouds_config', 'clouds', NULL, 'module'),
(42, 'fileman_view_all_settings', 'fileman', '', 'module'),
(43, 'fileman_edit_menu_types', 'fileman', '', 'module'),
(44, 'fileman_add_element_to_menu', 'fileman', '', 'module'),
(45, 'fileman_edit_menu_elements', 'fileman', '', 'module'),
(46, 'fileman_edit_existent_files', 'fileman', '', 'module'),
(47, 'fileman_edit_existent_folders', 'fileman', '', 'module'),
(48, 'fileman_admin_files', 'fileman', '', 'module'),
(49, 'fileman_admin_folders', 'fileman', '', 'module'),
(50, 'fileman_view_permissions', 'fileman', '', 'module'),
(51, 'fileman_edit_all_settings', 'fileman', '', 'module'),
(52, 'fileman_upload_files', 'fileman', '', 'module'),
(53, 'fileman_view_file_structure', 'fileman', '', 'module'),
(54, 'fileman_install_control', 'fileman', '', 'module'),
(55, 'medialib_view_collection', 'fileman', '', 'medialib'),
(56, 'medialib_new_collection', 'fileman', '', 'medialib'),
(57, 'medialib_edit_collection', 'fileman', '', 'medialib'),
(58, 'medialib_del_collection', 'fileman', '', 'medialib'),
(59, 'medialib_access', 'fileman', '', 'medialib'),
(60, 'medialib_new_item', 'fileman', '', 'medialib'),
(61, 'medialib_edit_item', 'fileman', '', 'medialib'),
(62, 'medialib_del_item', 'fileman', '', 'medialib'),
(63, 'sticker_view', 'fileman', '', 'stickers'),
(64, 'sticker_edit', 'fileman', '', 'stickers'),
(65, 'sticker_new', 'fileman', '', 'stickers'),
(66, 'sticker_del', 'fileman', '', 'stickers'),
(67, 'hl_element_read', 'highloadblock', NULL, 'module'),
(68, 'hl_element_write', 'highloadblock', NULL, 'module'),
(69, 'hl_element_delete', 'highloadblock', NULL, 'module'),
(70, 'section_read', 'iblock', NULL, 'iblock'),
(71, 'element_read', 'iblock', NULL, 'iblock'),
(72, 'section_element_bind', 'iblock', NULL, 'iblock'),
(73, 'iblock_admin_display', 'iblock', NULL, 'iblock'),
(74, 'element_edit', 'iblock', NULL, 'iblock'),
(75, 'element_edit_price', 'iblock', NULL, 'iblock'),
(76, 'element_delete', 'iblock', NULL, 'iblock'),
(77, 'element_bizproc_start', 'iblock', NULL, 'iblock'),
(78, 'section_edit', 'iblock', NULL, 'iblock'),
(79, 'section_delete', 'iblock', NULL, 'iblock'),
(80, 'section_section_bind', 'iblock', NULL, 'iblock'),
(81, 'element_edit_any_wf_status', 'iblock', NULL, 'iblock'),
(82, 'iblock_edit', 'iblock', NULL, 'iblock'),
(83, 'iblock_delete', 'iblock', NULL, 'iblock'),
(84, 'iblock_rights_edit', 'iblock', NULL, 'iblock'),
(85, 'iblock_export', 'iblock', NULL, 'iblock'),
(86, 'section_rights_edit', 'iblock', NULL, 'iblock'),
(87, 'element_rights_edit', 'iblock', NULL, 'iblock'),
(88, 'seo_settings', 'seo', '', 'module'),
(89, 'seo_tools', 'seo', '', 'module');

-- --------------------------------------------------------

--
-- Структура таблицы `b_option`
--

CREATE TABLE `b_option` (
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_option`
--

INSERT INTO `b_option` (`MODULE_ID`, `NAME`, `VALUE`, `DESCRIPTION`, `SITE_ID`) VALUES
('main', 'rating_authority_rating', '2', NULL, NULL),
('main', 'rating_assign_rating_group_add', '1', NULL, NULL),
('main', 'rating_assign_rating_group_delete', '1', NULL, NULL),
('main', 'rating_assign_rating_group', '3', NULL, NULL),
('main', 'rating_assign_authority_group_add', '2', NULL, NULL),
('main', 'rating_assign_authority_group_delete', '2', NULL, NULL),
('main', 'rating_assign_authority_group', '4', NULL, NULL),
('main', 'rating_community_size', '1', NULL, NULL),
('main', 'rating_community_authority', '30', NULL, NULL),
('main', 'rating_vote_weight', '10', NULL, NULL),
('main', 'rating_normalization_type', 'auto', NULL, NULL),
('main', 'rating_normalization', '10', NULL, NULL),
('main', 'rating_count_vote', '10', NULL, NULL),
('main', 'rating_authority_weight_formula', 'Y', NULL, NULL),
('main', 'rating_community_last_visit', '90', NULL, NULL),
('main', 'rating_text_like_y', 'Нравится', NULL, NULL),
('main', 'rating_text_like_n', 'Не нравится', NULL, NULL),
('main', 'rating_text_like_d', 'Это нравится', NULL, NULL),
('main', 'rating_assign_type', 'auto', NULL, NULL),
('main', 'rating_vote_type', 'like', NULL, NULL),
('main', 'rating_self_vote', 'Y', NULL, NULL),
('main', 'rating_vote_show', 'Y', NULL, NULL),
('main', 'rating_vote_template', 'like', NULL, NULL),
('main', 'rating_start_authority', '3', NULL, NULL),
('main', 'PARAM_MAX_SITES', '2', NULL, NULL),
('main', 'PARAM_MAX_USERS', '0', NULL, NULL),
('main', 'distributive6', 'Y', NULL, NULL),
('main', '~new_license11_sign', 'Y', NULL, NULL),
('main', 'GROUP_DEFAULT_TASK', '1', NULL, NULL),
('main', 'vendor', '1c_bitrix', NULL, NULL),
('main', 'admin_lid', 'ru', NULL, NULL),
('main', 'update_site', 'www.bitrixsoft.com', NULL, NULL),
('main', 'update_site_ns', 'Y', NULL, NULL),
('main', 'optimize_css_files', 'Y', NULL, NULL),
('main', 'optimize_js_files', 'Y', NULL, NULL),
('main', 'admin_passwordh', 'FVkQcWYUBgYtCUVcABcCCgsTAQ==', NULL, NULL),
('main', 'server_uniq_id', '9229b5a103525481f6bc6debc5080602', NULL, NULL),
('fileman', 'use_editor_3', 'Y', NULL, NULL),
('search', 'version', 'v2.0', NULL, NULL),
('search', 'dbnode_id', 'N', NULL, NULL),
('search', 'dbnode_status', 'ok', NULL, NULL),
('main', 'email_from', 'prog3@insideonline.ru', NULL, NULL),
('fileman', 'stickers_use_hotkeys', 'N', NULL, NULL),
('main', 'signer_default_key', '2f76be151722ca5279480dd4d9be396c512ca47ef5017e416c9952b5174c9eb0a716cd2a680a649195c56e1540d665abf80aa6a8c97f815da732a0302720b709', NULL, NULL),
('main', 'site_checker_access', 'Y', NULL, NULL),
('main', 'site_checker_success', 'N', NULL, NULL),
('main', '~update_autocheck_result', 'a:3:{s:10:\"check_date\";i:0;s:6:\"result\";b:0;s:5:\"error\";s:56:\"[LICENSE_NOT_FOUND] Лицензия не найдена\";}', NULL, NULL),
('main', 'update_system_check', '22.08.2017 18:23:35', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_cache`
--

CREATE TABLE `b_perf_cache` (
  `ID` int(18) NOT NULL,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_SIZE` float DEFAULT NULL,
  `OP_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8_unicode_ci,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  `BASE_DIR` text COLLATE utf8_unicode_ci,
  `INIT_DIR` text COLLATE utf8_unicode_ci,
  `FILE_NAME` text COLLATE utf8_unicode_ci,
  `FILE_PATH` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_cluster`
--

CREATE TABLE `b_perf_cluster` (
  `ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `THREADS` int(11) DEFAULT NULL,
  `HITS` int(11) DEFAULT NULL,
  `ERRORS` int(11) DEFAULT NULL,
  `PAGES_PER_SECOND` float DEFAULT NULL,
  `PAGE_EXEC_TIME` float DEFAULT NULL,
  `PAGE_RESP_TIME` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_component`
--

CREATE TABLE `b_perf_component` (
  `ID` int(18) NOT NULL,
  `HIT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `CACHE_COUNT_R` int(11) DEFAULT NULL,
  `CACHE_COUNT_W` int(11) DEFAULT NULL,
  `CACHE_COUNT_C` int(11) DEFAULT NULL,
  `COMPONENT_TIME` float DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_error`
--

CREATE TABLE `b_perf_error` (
  `ID` int(18) NOT NULL,
  `HIT_ID` int(18) DEFAULT NULL,
  `ERRNO` int(18) DEFAULT NULL,
  `ERRSTR` text COLLATE utf8_unicode_ci,
  `ERRFILE` text COLLATE utf8_unicode_ci,
  `ERRLINE` int(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_history`
--

CREATE TABLE `b_perf_history` (
  `ID` int(18) NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `TOTAL_MARK` float DEFAULT NULL,
  `ACCELERATOR_ENABLED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_hit`
--

CREATE TABLE `b_perf_hit` (
  `ID` int(11) NOT NULL,
  `DATE_HIT` datetime DEFAULT NULL,
  `IS_ADMIN` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_METHOD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVER_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVER_PORT` int(11) DEFAULT NULL,
  `SCRIPT_NAME` text COLLATE utf8_unicode_ci,
  `REQUEST_URI` text COLLATE utf8_unicode_ci,
  `INCLUDED_FILES` int(11) DEFAULT NULL,
  `MEMORY_PEAK_USAGE` int(11) DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `CACHE_COUNT_R` int(11) DEFAULT NULL,
  `CACHE_COUNT_W` int(11) DEFAULT NULL,
  `CACHE_COUNT_C` int(11) DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENTS` int(11) DEFAULT NULL,
  `COMPONENTS_TIME` float DEFAULT NULL,
  `SQL_LOG` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGE_TIME` float DEFAULT NULL,
  `PROLOG_TIME` float DEFAULT NULL,
  `PROLOG_BEFORE_TIME` float DEFAULT NULL,
  `AGENTS_TIME` float DEFAULT NULL,
  `PROLOG_AFTER_TIME` float DEFAULT NULL,
  `WORK_AREA_TIME` float DEFAULT NULL,
  `EPILOG_TIME` float DEFAULT NULL,
  `EPILOG_BEFORE_TIME` float DEFAULT NULL,
  `EVENTS_TIME` float DEFAULT NULL,
  `EPILOG_AFTER_TIME` float DEFAULT NULL,
  `MENU_RECALC` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_index_ban`
--

CREATE TABLE `b_perf_index_ban` (
  `ID` int(11) NOT NULL,
  `BAN_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_index_complete`
--

CREATE TABLE `b_perf_index_complete` (
  `ID` int(11) NOT NULL,
  `BANNED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_index_suggest`
--

CREATE TABLE `b_perf_index_suggest` (
  `ID` int(11) NOT NULL,
  `SQL_MD5` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_COUNT` int(11) DEFAULT NULL,
  `SQL_TIME` float DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_ALIAS` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_TEXT` text COLLATE utf8_unicode_ci,
  `SQL_EXPLAIN` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_index_suggest_sql`
--

CREATE TABLE `b_perf_index_suggest_sql` (
  `SUGGEST_ID` int(11) NOT NULL,
  `SQL_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_sql`
--

CREATE TABLE `b_perf_sql` (
  `ID` int(18) NOT NULL,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `QUERY_TIME` float DEFAULT NULL,
  `NODE_ID` int(18) DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8_unicode_ci,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  `SQL_TEXT` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_sql_backtrace`
--

CREATE TABLE `b_perf_sql_backtrace` (
  `SQL_ID` int(18) NOT NULL,
  `NN` int(18) NOT NULL,
  `FILE_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINE_NO` int(18) DEFAULT NULL,
  `CLASS_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FUNCTION_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_tab_column_stat`
--

CREATE TABLE `b_perf_tab_column_stat` (
  `ID` int(11) NOT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  `COLUMN_ROWS` float DEFAULT NULL,
  `VALUE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_tab_stat`
--

CREATE TABLE `b_perf_tab_stat` (
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TABLE_SIZE` float DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_test`
--

CREATE TABLE `b_perf_test` (
  `ID` int(18) NOT NULL,
  `REFERENCE_ID` int(18) DEFAULT NULL,
  `NAME` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating`
--

CREATE TABLE `b_rating` (
  `ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CALCULATION_METHOD` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SUM',
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `POSITION` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `AUTHORITY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `CALCULATED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONFIGS` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_rating`
--

INSERT INTO `b_rating` (`ID`, `ACTIVE`, `NAME`, `ENTITY_ID`, `CALCULATION_METHOD`, `CREATED`, `LAST_MODIFIED`, `LAST_CALCULATED`, `POSITION`, `AUTHORITY`, `CALCULATED`, `CONFIGS`) VALUES
(1, 'N', 'Рейтинг', 'USER', 'SUM', '2017-08-16 21:16:28', NULL, NULL, 'Y', 'N', 'N', 'a:3:{s:4:\"MAIN\";a:2:{s:4:\"VOTE\";a:1:{s:4:\"USER\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:5:\"BONUS\";a:2:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";}}}s:5:\"FORUM\";a:2:{s:4:\"VOTE\";a:2:{s:5:\"TOPIC\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.5\";s:5:\"LIMIT\";s:2:\"30\";}s:4:\"POST\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:9:{s:6:\"ACTIVE\";s:1:\"Y\";s:16:\"TODAY_TOPIC_COEF\";s:3:\"0.4\";s:15:\"WEEK_TOPIC_COEF\";s:3:\"0.2\";s:16:\"MONTH_TOPIC_COEF\";s:3:\"0.1\";s:14:\"ALL_TOPIC_COEF\";s:1:\"0\";s:15:\"TODAY_POST_COEF\";s:3:\"0.2\";s:14:\"WEEK_POST_COEF\";s:3:\"0.1\";s:15:\"MONTH_POST_COEF\";s:4:\"0.05\";s:13:\"ALL_POST_COEF\";s:1:\"0\";}}}s:4:\"BLOG\";a:2:{s:4:\"VOTE\";a:2:{s:4:\"POST\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.5\";s:5:\"LIMIT\";s:2:\"30\";}s:7:\"COMMENT\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:9:{s:6:\"ACTIVE\";s:1:\"Y\";s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";s:18:\"TODAY_COMMENT_COEF\";s:3:\"0.2\";s:17:\"WEEK_COMMENT_COEF\";s:3:\"0.1\";s:18:\"MONTH_COMMENT_COEF\";s:4:\"0.05\";s:16:\"ALL_COMMENT_COEF\";s:1:\"0\";}}}}'),
(2, 'N', 'Авторитет', 'USER', 'SUM', '2017-08-16 21:16:28', NULL, NULL, 'Y', 'Y', 'N', 'a:3:{s:4:\"MAIN\";a:2:{s:4:\"VOTE\";a:1:{s:4:\"USER\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:1:\"0\";}}s:6:\"RATING\";a:1:{s:5:\"BONUS\";a:2:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";}}}s:5:\"FORUM\";a:2:{s:4:\"VOTE\";a:2:{s:5:\"TOPIC\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}s:4:\"POST\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:8:{s:16:\"TODAY_TOPIC_COEF\";s:2:\"20\";s:15:\"WEEK_TOPIC_COEF\";s:2:\"10\";s:16:\"MONTH_TOPIC_COEF\";s:1:\"5\";s:14:\"ALL_TOPIC_COEF\";s:1:\"0\";s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";}}}s:4:\"BLOG\";a:2:{s:4:\"VOTE\";a:2:{s:4:\"POST\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}s:7:\"COMMENT\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:8:{s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";s:18:\"TODAY_COMMENT_COEF\";s:3:\"0.2\";s:17:\"WEEK_COMMENT_COEF\";s:3:\"0.1\";s:18:\"MONTH_COMMENT_COEF\";s:4:\"0.05\";s:16:\"ALL_COMMENT_COEF\";s:1:\"0\";}}}}');

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_component`
--

CREATE TABLE `b_rating_component` (
  `ID` int(11) NOT NULL,
  `RATING_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CALC_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXCEPTION_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `NEXT_CALCULATION` datetime DEFAULT NULL,
  `REFRESH_INTERVAL` int(11) NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_component_results`
--

CREATE TABLE `b_rating_component_results` (
  `ID` int(11) NOT NULL,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_prepare`
--

CREATE TABLE `b_rating_prepare` (
  `ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_results`
--

CREATE TABLE `b_rating_results` (
  `ID` int(11) NOT NULL,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  `PREVIOUS_VALUE` decimal(18,4) DEFAULT NULL,
  `CURRENT_POSITION` int(11) DEFAULT '0',
  `PREVIOUS_POSITION` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_rule`
--

CREATE TABLE `b_rating_rule` (
  `ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NAME` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_MODULE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONDITION_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_CONFIG` text COLLATE utf8_unicode_ci,
  `ACTION_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `ACTION_CONFIG` text COLLATE utf8_unicode_ci,
  `ACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVATE_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVATE_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DEACTIVATE_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEACTIVATE_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_APPLIED` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_rating_rule`
--

INSERT INTO `b_rating_rule` (`ID`, `ACTIVE`, `NAME`, `ENTITY_TYPE_ID`, `CONDITION_NAME`, `CONDITION_MODULE`, `CONDITION_CLASS`, `CONDITION_METHOD`, `CONDITION_CONFIG`, `ACTION_NAME`, `ACTION_CONFIG`, `ACTIVATE`, `ACTIVATE_CLASS`, `ACTIVATE_METHOD`, `DEACTIVATE`, `DEACTIVATE_CLASS`, `DEACTIVATE_METHOD`, `CREATED`, `LAST_MODIFIED`, `LAST_APPLIED`) VALUES
(1, 'N', 'Добавление в группу пользователей, имеющих право голосовать за рейтинг', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:1;s:12:\"RATING_VALUE\";i:1;}}', 'ADD_TO_GROUP', 'a:1:{s:12:\"ADD_TO_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"3\";}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2017-08-16 21:16:28', '2017-08-16 21:16:28', NULL),
(2, 'N', 'Удаление из группы пользователей, не имеющих права голосовать за рейтинг', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:2;s:12:\"RATING_VALUE\";i:1;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:\"REMOVE_FROM_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"3\";}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2017-08-16 21:16:28', '2017-08-16 21:16:28', NULL),
(3, 'N', 'Добавление в группу пользователей, имеющих право голосовать за авторитет', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:1;s:12:\"RATING_VALUE\";i:2;}}', 'ADD_TO_GROUP', 'a:1:{s:12:\"ADD_TO_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"4\";}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2017-08-16 21:16:28', '2017-08-16 21:16:28', NULL),
(4, 'N', 'Удаление из группы пользователей, не имеющих права голосовать за авторитет', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:2;s:12:\"RATING_VALUE\";i:2;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:\"REMOVE_FROM_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"4\";}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2017-08-16 21:16:28', '2017-08-16 21:16:28', NULL),
(5, 'Y', 'Автоматическое голосование за авторитет пользователя', 'USER', 'VOTE', NULL, 'CRatingRulesMain', 'voteCheck', 'a:1:{s:4:\"VOTE\";a:6:{s:10:\"VOTE_LIMIT\";i:90;s:11:\"VOTE_RESULT\";i:10;s:16:\"VOTE_FORUM_TOPIC\";d:0.5;s:15:\"VOTE_FORUM_POST\";d:0.10000000000000001;s:14:\"VOTE_BLOG_POST\";d:0.5;s:17:\"VOTE_BLOG_COMMENT\";d:0.10000000000000001;}}', 'empty', 'a:0:{}', 'N', 'empty', 'empty', 'N', 'empty ', 'empty', '2017-08-16 21:16:28', '2017-08-16 21:16:28', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_rule_vetting`
--

CREATE TABLE `b_rating_rule_vetting` (
  `ID` int(11) NOT NULL,
  `RULE_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `APPLIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_user`
--

CREATE TABLE `b_rating_user` (
  `ID` int(11) NOT NULL,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `BONUS` decimal(18,4) DEFAULT '0.0000',
  `VOTE_WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `VOTE_COUNT` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_rating_user`
--

INSERT INTO `b_rating_user` (`ID`, `RATING_ID`, `ENTITY_ID`, `BONUS`, `VOTE_WEIGHT`, `VOTE_COUNT`) VALUES
(1, 2, 1, '3.0000', '30.0000', 13);

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_vote`
--

CREATE TABLE `b_rating_vote` (
  `ID` int(11) NOT NULL,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `VALUE` decimal(18,4) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `USER_IP` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_vote_group`
--

CREATE TABLE `b_rating_vote_group` (
  `ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_rating_vote_group`
--

INSERT INTO `b_rating_vote_group` (`ID`, `GROUP_ID`, `TYPE`) VALUES
(5, 1, 'A'),
(1, 1, 'R'),
(3, 1, 'R'),
(2, 3, 'R'),
(4, 3, 'R'),
(6, 4, 'A');

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_voting`
--

CREATE TABLE `b_rating_voting` (
  `ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_voting_prepare`
--

CREATE TABLE `b_rating_voting_prepare` (
  `ID` int(11) NOT NULL,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_weight`
--

CREATE TABLE `b_rating_weight` (
  `ID` int(11) NOT NULL,
  `RATING_FROM` decimal(18,4) NOT NULL,
  `RATING_TO` decimal(18,4) NOT NULL,
  `WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `COUNT` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_rating_weight`
--

INSERT INTO `b_rating_weight` (`ID`, `RATING_FROM`, `RATING_TO`, `WEIGHT`, `COUNT`) VALUES
(1, '-1000000.0000', '1000000.0000', '1.0000', 10);

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content`
--

CREATE TABLE `b_search_content` (
  `ID` int(11) NOT NULL,
  `DATE_CHANGE` datetime NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CUSTOM_RANK` int(11) NOT NULL DEFAULT '0',
  `USER_ID` int(11) DEFAULT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENTITY_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  `TITLE` text COLLATE utf8_unicode_ci,
  `BODY` longtext COLLATE utf8_unicode_ci,
  `TAGS` text COLLATE utf8_unicode_ci,
  `PARAM1` text COLLATE utf8_unicode_ci,
  `PARAM2` text COLLATE utf8_unicode_ci,
  `UPD` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_FROM` datetime DEFAULT NULL,
  `DATE_TO` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_search_content`
--

INSERT INTO `b_search_content` (`ID`, `DATE_CHANGE`, `MODULE_ID`, `ITEM_ID`, `CUSTOM_RANK`, `USER_ID`, `ENTITY_TYPE_ID`, `ENTITY_ID`, `URL`, `TITLE`, `BODY`, `TAGS`, `PARAM1`, `PARAM2`, `UPD`, `DATE_FROM`, `DATE_TO`) VALUES
(5, '2017-08-26 15:36:37', 'main', 's1|/katalog/index.php', 0, NULL, NULL, NULL, '/katalog/index.php', 'Категории', 'Главная\rКаталог\rКатегория\rАксессуары', '', '', '', NULL, NULL, NULL),
(6, '2017-08-26 15:26:52', 'main', 's1|/katalog/tovar.php', 0, NULL, NULL, NULL, '/katalog/tovar.php', 'Товар', 'Главная\rКаталог\rКатегория\rПохожие товары\rТовар\nТовар\nТовар\nТовар\nТовар', '', '', '', NULL, NULL, NULL),
(7, '2017-08-17 19:46:45', 'main', 's1|/katalog/category.php', 0, NULL, NULL, NULL, '/katalog/category.php', 'Категории', 'Главная\rКаталог\rКатегория\rАксессуары\rНаименование подкатегории\rНаименование подкатегории\rНаименование подкатегории\rНаименование подкатегории\rНаименование подкатегории\rНаименование подкатегории\rНаименование подкатегории\rНаименование подкатегории\rНаименование подкатегории', '', '', '', NULL, NULL, NULL),
(24, '2017-08-22 22:28:32', 'iblock', 'S19', 0, NULL, NULL, NULL, '=ID=19&EXTERNAL_ID=&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=gates', 'GATES', '', NULL, 'catalog', '1', NULL, NULL, NULL),
(26, '2017-08-22 22:30:00', 'iblock', 'S20', 0, NULL, NULL, NULL, '=ID=20&EXTERNAL_ID=&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=mmc', 'MMC', '', NULL, 'catalog', '1', NULL, NULL, NULL),
(27, '2017-08-22 22:33:23', 'iblock', 'S21', 0, NULL, NULL, NULL, '=ID=21&EXTERNAL_ID=&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=toyota', 'TOYOTA', '', NULL, 'catalog', '1', NULL, NULL, NULL),
(28, '2017-08-22 22:33:31', 'iblock', 'S22', 0, NULL, NULL, NULL, '=ID=22&EXTERNAL_ID=&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=vernet', 'VERNET', '', NULL, 'catalog', '1', NULL, NULL, NULL),
(29, '2017-08-22 22:33:40', 'iblock', 'S23', 0, NULL, NULL, NULL, '=ID=23&EXTERNAL_ID=&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=depo', 'DEPO', '', NULL, 'catalog', '1', NULL, NULL, NULL),
(30, '2017-08-22 22:33:48', 'iblock', 'S24', 0, NULL, NULL, NULL, '=ID=24&EXTERNAL_ID=&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=nissan', 'NISSAN', '', NULL, 'catalog', '1', NULL, NULL, NULL),
(31, '2017-08-22 22:33:56', 'iblock', 'S25', 0, NULL, NULL, NULL, '=ID=25&EXTERNAL_ID=&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=ocap', 'OCAP', '', NULL, 'catalog', '1', NULL, NULL, NULL),
(32, '2017-08-22 22:34:13', 'iblock', 'S26', 0, NULL, NULL, NULL, '=ID=26&EXTERNAL_ID=&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=opel', 'OPEL', '', NULL, 'catalog', '1', NULL, NULL, NULL),
(33, '2017-08-22 22:34:22', 'iblock', 'S27', 0, NULL, NULL, NULL, '=ID=27&EXTERNAL_ID=&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=fram', 'FRAM', '', NULL, 'catalog', '1', NULL, NULL, NULL),
(34, '2017-08-22 22:34:32', 'iblock', 'S28', 0, NULL, NULL, NULL, '=ID=28&EXTERNAL_ID=&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=bosch', 'BOSCH', '', NULL, 'catalog', '1', NULL, NULL, NULL),
(35, '2017-08-22 22:34:41', 'iblock', 'S29', 0, NULL, NULL, NULL, '=ID=29&EXTERNAL_ID=&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=febi', 'FEBI', '', NULL, 'catalog', '1', NULL, NULL, NULL),
(36, '2017-08-22 22:34:51', 'iblock', 'S30', 0, NULL, NULL, NULL, '=ID=30&EXTERNAL_ID=&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=mtf-light', 'MTF Light', '', NULL, 'catalog', '1', NULL, NULL, NULL),
(37, '2017-08-22 22:35:02', 'iblock', 'S31', 0, NULL, NULL, NULL, '=ID=31&EXTERNAL_ID=&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=norplast', 'NORPLAST', '', NULL, 'catalog', '1', NULL, NULL, NULL),
(38, '2017-08-22 22:35:12', 'iblock', 'S32', 0, NULL, NULL, NULL, '=ID=32&EXTERNAL_ID=&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=svs', 'SVS', '', NULL, 'catalog', '1', NULL, NULL, NULL),
(39, '2017-08-22 22:35:21', 'iblock', 'S33', 0, NULL, NULL, NULL, '=ID=33&EXTERNAL_ID=&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=alfeco', 'ALFECO', '', NULL, 'catalog', '1', NULL, NULL, NULL),
(40, '2017-08-22 22:35:31', 'iblock', 'S34', 0, NULL, NULL, NULL, '=ID=34&EXTERNAL_ID=&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=slim', 'SLIM', '', NULL, 'catalog', '1', NULL, NULL, NULL),
(41, '2017-08-22 22:35:52', 'iblock', 'S35', 0, NULL, NULL, NULL, '=ID=35&EXTERNAL_ID=&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=air-couture', 'AIR COUTURE', '', NULL, 'catalog', '1', NULL, NULL, NULL),
(42, '2017-08-22 22:36:10', 'iblock', 'S36', 0, NULL, NULL, NULL, '=ID=36&EXTERNAL_ID=&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=airline', 'AIRLINE', '', NULL, 'catalog', '1', NULL, NULL, NULL),
(43, '2017-08-22 22:36:19', 'iblock', 'S37', 0, NULL, NULL, NULL, '=ID=37&EXTERNAL_ID=&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=aileron', 'AILERON', '', NULL, 'catalog', '1', NULL, NULL, NULL),
(44, '2017-08-22 22:36:28', 'iblock', 'S38', 0, NULL, NULL, NULL, '=ID=38&EXTERNAL_ID=&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=carmate', 'CARMATE', '', NULL, 'catalog', '1', NULL, NULL, NULL),
(45, '2017-08-22 22:36:37', 'iblock', 'S39', 0, NULL, NULL, NULL, '=ID=39&EXTERNAL_ID=&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=sim', 'SIM', '', NULL, 'catalog', '1', NULL, NULL, NULL),
(46, '2017-08-22 21:53:59', 'iblock', '4', 0, NULL, NULL, NULL, '=ID=4&EXTERNAL_ID=4&IBLOCK_SECTION_ID=19&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Ремень ручейковый GATES 4PK948 MMC Pajero 3.0i', '4PK948', '', 'catalog', '1', NULL, NULL, NULL),
(47, '2017-08-22 21:53:59', 'iblock', '5', 0, NULL, NULL, NULL, '=ID=5&EXTERNAL_ID=5&IBLOCK_SECTION_ID=19&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Ремень ручейковый GATES 4PK993 MMC Pajero 3.5i', '4PK993', '', 'catalog', '1', NULL, NULL, NULL),
(48, '2017-08-22 21:53:59', 'iblock', '6', 0, NULL, NULL, NULL, '=ID=6&EXTERNAL_ID=6&IBLOCK_SECTION_ID=19&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Ремень ручейковый GATES 4PK1063 MMC Pajero 3.5i (4PK1063)', '4PK1063', '', 'catalog', '1', NULL, NULL, NULL),
(49, '2017-08-22 21:53:59', 'iblock', '7', 0, NULL, NULL, NULL, '=ID=7&EXTERNAL_ID=7&IBLOCK_SECTION_ID=19&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Ремень генератора GATES 6462MC MMC Pajero 3.0i', '6462MC', '', 'catalog', '1', NULL, NULL, NULL),
(50, '2017-08-22 21:53:59', 'iblock', '8', 0, NULL, NULL, NULL, '=ID=8&EXTERNAL_ID=8&IBLOCK_SECTION_ID=19&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Ремень ручейковый GATES 5PK1123 MMC Pajero 3.0i 91>', '5PK1123', '', 'catalog', '1', NULL, NULL, NULL),
(51, '2017-08-22 21:53:59', 'iblock', '9', 0, NULL, NULL, NULL, '=ID=9&EXTERNAL_ID=9&IBLOCK_SECTION_ID=19&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Ремень генератора GATES 6220MC TOYOTA L.Cr.FJ80 4.2TD', '6220MC', '', 'catalog', '1', NULL, NULL, NULL),
(52, '2017-08-22 21:53:59', 'iblock', '10', 0, NULL, NULL, NULL, '=ID=10&EXTERNAL_ID=10&IBLOCK_SECTION_ID=19&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Ремень ГРМ GATES 5228XS MMC Pajero 3.0i -94', '5228XS', '', 'catalog', '1', NULL, NULL, NULL),
(53, '2017-08-22 21:53:59', 'iblock', '11', 0, NULL, NULL, NULL, '=ID=11&EXTERNAL_ID=11&IBLOCK_SECTION_ID=20&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Ремень ГРМ MMC MD111427 MMC Pajero 3.0 -94 SOHC', 'MD111427', '', 'catalog', '1', NULL, NULL, NULL),
(54, '2017-08-22 21:53:59', 'iblock', '12', 0, NULL, NULL, NULL, '=ID=12&EXTERNAL_ID=12&IBLOCK_SECTION_ID=20&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Ремень ГРМ MMC MD307487 MMC Pajero 3.0 94- SOHC', 'MD307487', '', 'catalog', '1', NULL, NULL, NULL),
(55, '2017-08-22 21:53:59', 'iblock', '13', 0, NULL, NULL, NULL, '=ID=13&EXTERNAL_ID=13&IBLOCK_SECTION_ID=21&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Ремень ГРМ TOYOTA 1356819065 (94*25,4) L.Cr.FJ80/100 HZ HDT', '1356819065', '', 'catalog', '1', NULL, NULL, NULL),
(56, '2017-08-22 21:53:59', 'iblock', '14', 0, NULL, NULL, NULL, '=ID=14&EXTERNAL_ID=14&IBLOCK_SECTION_ID=19&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Ремень генератора GATES 6467MC MMC Pajero 3.0i 3.5i', '6467MC', '', 'catalog', '1', NULL, NULL, NULL),
(57, '2017-08-22 21:53:59', 'iblock', '15', 0, NULL, NULL, NULL, '=ID=15&EXTERNAL_ID=15&IBLOCK_SECTION_ID=19&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Ремень генератора GATES 6478MC TOYOTA 4-Ranner 3.0 2.4TD', '6478MC', '', 'catalog', '1', NULL, NULL, NULL),
(58, '2017-08-22 21:53:59', 'iblock', '16', 0, NULL, NULL, NULL, '=ID=16&EXTERNAL_ID=16&IBLOCK_SECTION_ID=19&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Ремень генератора GATES 6481MC TOYOTA L.Cr.FJ80 4.2TD', '6481MC', '', 'catalog', '1', NULL, NULL, NULL),
(59, '2017-08-22 21:53:59', 'iblock', '17', 0, NULL, NULL, NULL, '=ID=17&EXTERNAL_ID=17&IBLOCK_SECTION_ID=22&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Термостат VERNET TH627387J VW Passat 1.6/1.9TD/2.3 86-00/Audi 80/A4/A6 1.9TD 96-', 'TH627387J', '', 'catalog', '1', NULL, NULL, NULL),
(60, '2017-08-22 21:53:59', 'iblock', '18', 0, NULL, NULL, NULL, '=ID=18&EXTERNAL_ID=18&IBLOCK_SECTION_ID=23&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Поворотник DEPO 2131515RA ISUZU Trooper 92> R', '2131515RA', '', 'catalog', '1', NULL, NULL, NULL),
(61, '2017-08-22 21:53:59', 'iblock', '19', 0, NULL, NULL, NULL, '=ID=19&EXTERNAL_ID=19&IBLOCK_SECTION_ID=20&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Фонарь MMC MR124963 MMC Pajero 93> L', 'MR124963', '', 'catalog', '1', NULL, NULL, NULL),
(62, '2017-08-22 21:53:59', 'iblock', '20', 0, NULL, NULL, NULL, '=ID=20&EXTERNAL_ID=20&IBLOCK_SECTION_ID=21&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Амортизатор TOYOTA 4851139766 4 Run.-95 пер. газ.', '4851139766', '', 'catalog', '1', NULL, NULL, NULL),
(63, '2017-08-22 21:53:59', 'iblock', '21', 0, NULL, NULL, NULL, '=ID=21&EXTERNAL_ID=21&IBLOCK_SECTION_ID=21&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Амортизатор TOYOTA 4851169435 TOYOTA L.Cr.-80 пер.', '4851169435', '', 'catalog', '1', NULL, NULL, NULL),
(64, '2017-08-22 21:53:59', 'iblock', '22', 0, NULL, NULL, NULL, '=ID=22&EXTERNAL_ID=22&IBLOCK_SECTION_ID=20&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Втулка рессоры MMC MB111203 Pajero 84>', 'MB111203', '', 'catalog', '1', NULL, NULL, NULL),
(65, '2017-08-22 21:53:59', 'iblock', '23', 0, NULL, NULL, NULL, '=ID=23&EXTERNAL_ID=23&IBLOCK_SECTION_ID=20&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Втулка рессоры MMC MB584530 Pajero 91>', 'MB584530', '', 'catalog', '1', NULL, NULL, NULL),
(66, '2017-08-22 21:53:59', 'iblock', '24', 0, NULL, NULL, NULL, '=ID=24&EXTERNAL_ID=24&IBLOCK_SECTION_ID=20&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Втулка рессоры MMC MB584531 Pajero 91>', 'MB584531', '', 'catalog', '1', NULL, NULL, NULL),
(67, '2017-08-22 21:53:59', 'iblock', '25', 0, NULL, NULL, NULL, '=ID=25&EXTERNAL_ID=25&IBLOCK_SECTION_ID=20&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Тяга стабил. MMC MB598098 M.Pajero 5дв задн', 'MB598098', '', 'catalog', '1', NULL, NULL, NULL),
(68, '2017-08-22 21:53:59', 'iblock', '26', 0, NULL, NULL, NULL, '=ID=26&EXTERNAL_ID=26&IBLOCK_SECTION_ID=24&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Втулка стабил. NISSAN 546137F001 Terrano-II задн.', '546137F001', '', 'catalog', '1', NULL, NULL, NULL),
(69, '2017-08-22 21:53:59', 'iblock', '27', 0, NULL, NULL, NULL, '=ID=27&EXTERNAL_ID=27&IBLOCK_SECTION_ID=24&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Втулка стабил. NISSAN 54613VB010 Patrol Y61 задн. >2000г 18мм', '54613VB010', '', 'catalog', '1', NULL, NULL, NULL),
(70, '2017-08-22 21:54:00', 'iblock', '28', 0, NULL, NULL, NULL, '=ID=28&EXTERNAL_ID=28&IBLOCK_SECTION_ID=21&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Втулка стабил. TOYOTA 4881520200 D25 4 Runnner 92-95 задн.', '4881520200', '', 'catalog', '1', NULL, NULL, NULL),
(71, '2017-08-22 21:54:00', 'iblock', '29', 0, NULL, NULL, NULL, '=ID=29&EXTERNAL_ID=29&IBLOCK_SECTION_ID=21&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Втулка стабил. TOYOTA 4881526020 D25 Ln.Cruiser FJ80 08/92- задн.', '4881526020', '', 'catalog', '1', NULL, NULL, NULL),
(72, '2017-08-22 21:54:00', 'iblock', '30', 0, NULL, NULL, NULL, '=ID=30&EXTERNAL_ID=30&IBLOCK_SECTION_ID=21&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Втулка стабил. TOYOTA 4881530070 D16 4-Run задн.', '4881530070', '', 'catalog', '1', NULL, NULL, NULL),
(73, '2017-08-22 21:54:00', 'iblock', '31', 0, NULL, NULL, NULL, '=ID=31&EXTERNAL_ID=31&IBLOCK_SECTION_ID=20&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Втулка стабил. концевая MMC MB831039 Pajero 91> (2шт+2шайбы+гайка)', 'MB831039', '', 'catalog', '1', NULL, NULL, NULL),
(74, '2017-08-22 21:54:00', 'iblock', '32', 0, NULL, NULL, NULL, '=ID=32&EXTERNAL_ID=32&IBLOCK_SECTION_ID=24&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Втулка стабил. концевая NISSAN 56112V0100 Patrol,Terrano', '56112V0100', '', 'catalog', '1', NULL, NULL, NULL),
(75, '2017-08-22 21:54:00', 'iblock', '33', 0, NULL, NULL, NULL, '=ID=33&EXTERNAL_ID=33&IBLOCK_SECTION_ID=21&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Втулка стабил. концевая TOYOTA 4881730010 Ln.Cruiser FJ80', '4881730010', '', 'catalog', '1', NULL, NULL, NULL),
(76, '2017-08-22 21:54:00', 'iblock', '34', 0, NULL, NULL, NULL, '=ID=34&EXTERNAL_ID=34&IBLOCK_SECTION_ID=21&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Втулка стабил. концевая TOYOTA 4881730020 4 Run 93-', '4881730020', '', 'catalog', '1', NULL, NULL, NULL),
(77, '2017-08-22 21:54:00', 'iblock', '35', 0, NULL, NULL, NULL, '=ID=35&EXTERNAL_ID=35&IBLOCK_SECTION_ID=21&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Втулка стабил. концевая TOYOTA 9094801002 4 Runner', '9094801002', '', 'catalog', '1', NULL, NULL, NULL),
(78, '2017-08-22 21:54:00', 'iblock', '36', 0, NULL, NULL, NULL, '=ID=36&EXTERNAL_ID=36&IBLOCK_SECTION_ID=20&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Втулка стабил. MMC MR150092 Pajero 91> пер.', 'MR150092', '', 'catalog', '1', NULL, NULL, NULL),
(79, '2017-08-22 21:54:00', 'iblock', '37', 0, NULL, NULL, NULL, '=ID=37&EXTERNAL_ID=37&IBLOCK_SECTION_ID=20&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Втулка стабил. MMC MR150093 Pajero 91> пер.', 'MR150093', '', 'catalog', '1', NULL, NULL, NULL),
(80, '2017-08-22 21:54:00', 'iblock', '38', 0, NULL, NULL, NULL, '=ID=38&EXTERNAL_ID=38&IBLOCK_SECTION_ID=20&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Втулка стабил. MMC MR150095 Pajero 5 дв 94> пер.', 'MR150095', '', 'catalog', '1', NULL, NULL, NULL),
(81, '2017-08-22 21:54:00', 'iblock', '39', 0, NULL, NULL, NULL, '=ID=39&EXTERNAL_ID=39&IBLOCK_SECTION_ID=24&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Втулка стабил. NISSAN 5461342G00 Terrano 2.4i пер.', '5461342G00', '', 'catalog', '1', NULL, NULL, NULL),
(82, '2017-08-22 21:54:00', 'iblock', '40', 0, NULL, NULL, NULL, '=ID=40&EXTERNAL_ID=40&IBLOCK_SECTION_ID=24&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Втулка стабил. NISSAN 5461388G00 Terrano 2.4i/3.0i/2.7TD 89> пер.', '5461388G00', '', 'catalog', '1', NULL, NULL, NULL),
(83, '2017-08-22 21:54:00', 'iblock', '41', 0, NULL, NULL, NULL, '=ID=41&EXTERNAL_ID=41&IBLOCK_SECTION_ID=24&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Втулка стабил. NISSAN 546139C105 NISSAN Terrano II пер.', '546139C105', '', 'catalog', '1', NULL, NULL, NULL),
(84, '2017-08-22 21:54:00', 'iblock', '42', 0, NULL, NULL, NULL, '=ID=42&EXTERNAL_ID=42&IBLOCK_SECTION_ID=24&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Втулка стабил. NISSAN 54613VB002 Patrol Y61 пер.', '54613VB002', '', 'catalog', '1', NULL, NULL, NULL),
(85, '2017-08-22 21:54:00', 'iblock', '43', 0, NULL, NULL, NULL, '=ID=43&EXTERNAL_ID=43&IBLOCK_SECTION_ID=21&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Втулка стабил. TOYOTA 4881526250 D23 Ln.Cruiser 100 зад.', '4881526250', '', 'catalog', '1', NULL, NULL, NULL),
(86, '2017-08-22 21:54:00', 'iblock', '44', 0, NULL, NULL, NULL, '=ID=44&EXTERNAL_ID=44&IBLOCK_SECTION_ID=21&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Втулка стабил. TOYOTA 4881528080 D24 Ln.Cruiser FJ80 пер.', '4881528080', '', 'catalog', '1', NULL, NULL, NULL),
(87, '2017-08-22 21:54:00', 'iblock', '45', 0, NULL, NULL, NULL, '=ID=45&EXTERNAL_ID=45&IBLOCK_SECTION_ID=21&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Втулка стабил. TOYOTA 4881530040 D20 Carina E пер.', '4881530040', '', 'catalog', '1', NULL, NULL, NULL),
(88, '2017-08-22 21:54:00', 'iblock', '46', 0, NULL, NULL, NULL, '=ID=46&EXTERNAL_ID=46&IBLOCK_SECTION_ID=21&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Втулка стабил. TOYOTA 4881535070 D27 4 Runner 92-95 пер.', '4881535070', '', 'catalog', '1', NULL, NULL, NULL),
(89, '2017-08-22 21:54:00', 'iblock', '47', 0, NULL, NULL, NULL, '=ID=47&EXTERNAL_ID=47&IBLOCK_SECTION_ID=21&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Втулка стабил. TOYOTA 4881560040 D26 Ln.Cr. FJ80 пер.', '4881560040', '', 'catalog', '1', NULL, NULL, NULL),
(90, '2017-08-22 21:54:00', 'iblock', '48', 0, NULL, NULL, NULL, '=ID=48&EXTERNAL_ID=48&IBLOCK_SECTION_ID=21&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Втулка стабил. TOYOTA 4881560050 D24 Ln.Cr. FJ80 пер.', '4881560050', '', 'catalog', '1', NULL, NULL, NULL),
(91, '2017-08-22 21:54:00', 'iblock', '49', 0, NULL, NULL, NULL, '=ID=49&EXTERNAL_ID=49&IBLOCK_SECTION_ID=21&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Втулка стабил. TOYOTA 4881560070 D29 Ln.Cr. FJ80 пер.', '4881560070', '', 'catalog', '1', NULL, NULL, NULL),
(92, '2017-08-22 21:54:00', 'iblock', '50', 0, NULL, NULL, NULL, '=ID=50&EXTERNAL_ID=50&IBLOCK_SECTION_ID=21&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Втулка стабил. TOYOTA 4881560111 D27 Ln.Cr. 100 пер.', '4881560111', '', 'catalog', '1', NULL, NULL, NULL),
(93, '2017-08-22 21:54:00', 'iblock', '51', 0, NULL, NULL, NULL, '=ID=51&EXTERNAL_ID=51&IBLOCK_SECTION_ID=20&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Тяга стабил. MMC MR267876 Pajero 6/93 пер.L', 'MR267876', '', 'catalog', '1', NULL, NULL, NULL),
(94, '2017-08-22 21:54:00', 'iblock', '52', 0, NULL, NULL, NULL, '=ID=52&EXTERNAL_ID=52&IBLOCK_SECTION_ID=20&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Тяга стабил. MMC MR267877 Pajero 6/93 пер.R', 'MR267877', '', 'catalog', '1', NULL, NULL, NULL),
(95, '2017-08-22 21:54:00', 'iblock', '53', 0, NULL, NULL, NULL, '=ID=53&EXTERNAL_ID=53&IBLOCK_SECTION_ID=20&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Опора шаровая MMC MB860829 MMC Pajero 91> верх. L', 'MB860829', '', 'catalog', '1', NULL, NULL, NULL),
(96, '2017-08-22 21:54:00', 'iblock', '54', 0, NULL, NULL, NULL, '=ID=54&EXTERNAL_ID=54&IBLOCK_SECTION_ID=20&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Опора шаровая MMC MB860830 MMC Pajero 91> верх. R', 'MB860830', '', 'catalog', '1', NULL, NULL, NULL),
(97, '2017-08-22 21:54:00', 'iblock', '55', 0, NULL, NULL, NULL, '=ID=55&EXTERNAL_ID=55&IBLOCK_SECTION_ID=20&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Опора шаровая MMC MR296269 MMC Pajero 91> ниж. L', 'MR296269', '', 'catalog', '1', NULL, NULL, NULL),
(98, '2017-08-22 21:54:00', 'iblock', '56', 0, NULL, NULL, NULL, '=ID=56&EXTERNAL_ID=56&IBLOCK_SECTION_ID=20&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Опора шаровая MMC MR296270 MMC Pajero 91> ниж. R', 'MR296270', '', 'catalog', '1', NULL, NULL, NULL),
(99, '2017-08-22 21:54:00', 'iblock', '57', 0, NULL, NULL, NULL, '=ID=57&EXTERNAL_ID=57&IBLOCK_SECTION_ID=20&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'С/блок MMC MB109684 M.Pajero 91> пер.ниж.рыч.', 'MB109684', '', 'catalog', '1', NULL, NULL, NULL),
(100, '2017-08-22 21:54:00', 'iblock', '58', 0, NULL, NULL, NULL, '=ID=58&EXTERNAL_ID=58&IBLOCK_SECTION_ID=20&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'С/блок MMC MB631492 M.Pajero 91-6/93 задн.рыч.', 'MB631492', '', 'catalog', '1', NULL, NULL, NULL),
(101, '2017-08-22 21:54:00', 'iblock', '59', 0, NULL, NULL, NULL, '=ID=59&EXTERNAL_ID=59&IBLOCK_SECTION_ID=20&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'С/блок MMC MR112891 M.Pajero 6/93> задн.рыч.', 'MR112891', '', 'catalog', '1', NULL, NULL, NULL),
(102, '2017-08-22 21:54:00', 'iblock', '60', 0, NULL, NULL, NULL, '=ID=60&EXTERNAL_ID=60&IBLOCK_SECTION_ID=25&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Наконечник рулевой OCAP 0193759 TOYOTA 4-Runner внешний.', '0193759', '', 'catalog', '1', NULL, NULL, NULL),
(103, '2017-08-22 21:54:00', 'iblock', '61', 0, NULL, NULL, NULL, '=ID=61&EXTERNAL_ID=61&IBLOCK_SECTION_ID=21&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Наконечник рулевой TOYOTA 4504669135 L.Cr.FJ80 R', '4504669135', '', 'catalog', '1', NULL, NULL, NULL),
(104, '2017-08-22 21:54:00', 'iblock', '62', 0, NULL, NULL, NULL, '=ID=62&EXTERNAL_ID=62&IBLOCK_SECTION_ID=21&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Наконечник рулевой TOYOTA 4504769085 L.Cr.FJ80 L', '4504769085', '', 'catalog', '1', NULL, NULL, NULL),
(105, '2017-08-22 21:54:00', 'iblock', '63', 0, NULL, NULL, NULL, '=ID=63&EXTERNAL_ID=63&IBLOCK_SECTION_ID=26&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Подушка глушителя OPEL 0856024 OPEL Diesel', '0856024', '', 'catalog', '1', NULL, NULL, NULL),
(106, '2017-08-22 21:54:00', 'iblock', '64', 0, NULL, NULL, NULL, '=ID=64&EXTERNAL_ID=64&IBLOCK_SECTION_ID=20&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Ремк-т MMC MB858466 MMC Pajero 91> суппорта задн.', 'MB858466', '', 'catalog', '1', NULL, NULL, NULL),
(107, '2017-08-22 21:54:00', 'iblock', '65', 0, NULL, NULL, NULL, '=ID=65&EXTERNAL_ID=65&IBLOCK_SECTION_ID=20&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Корзина сцепления MMC MR317682 MMC  (D250) Pajero 2.8TD', 'MR317682', '', 'catalog', '1', NULL, NULL, NULL),
(108, '2017-08-22 21:54:00', 'iblock', '66', 0, NULL, NULL, NULL, '=ID=66&EXTERNAL_ID=66&IBLOCK_SECTION_ID=20&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Сальник MMC MB160578 42*65*12 MMC Pajero пер.моста', 'MB160578', '', 'catalog', '1', NULL, NULL, NULL),
(109, '2017-08-22 21:54:00', 'iblock', '67', 0, NULL, NULL, NULL, '=ID=67&EXTERNAL_ID=67&IBLOCK_SECTION_ID=20&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Сальник раздатки MMC MB919210 MMC Pajero на кардан', 'MB919210', '', 'catalog', '1', NULL, NULL, NULL),
(110, '2017-08-22 21:54:00', 'iblock', '68', 0, NULL, NULL, NULL, '=ID=68&EXTERNAL_ID=68&IBLOCK_SECTION_ID=27&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Фильтр масляный FRAM PH3614 TOYOTA, Chrysler Voyager 2.4 ВОЛГА', 'PH3614', '', 'catalog', '1', NULL, NULL, NULL),
(111, '2017-08-22 21:54:00', 'iblock', '69', 0, NULL, NULL, NULL, '=ID=69&EXTERNAL_ID=69&IBLOCK_SECTION_ID=27&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Фильтр масляный FRAM PH6355 MMC 2.5TD', 'PH6355', '', 'catalog', '1', NULL, NULL, NULL),
(112, '2017-08-22 21:54:00', 'iblock', '70', 0, NULL, NULL, NULL, '=ID=70&EXTERNAL_ID=70&IBLOCK_SECTION_ID=28&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Фильтр масляный BOSCH 0986452063 MMC Pajero 2.8TD', '0986452063', '', 'catalog', '1', NULL, NULL, NULL),
(113, '2017-08-22 21:54:00', 'iblock', '71', 0, NULL, NULL, NULL, '=ID=71&EXTERNAL_ID=71&IBLOCK_SECTION_ID=29&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Антифриз FEBI 01089 синий 1.5L концентрат 1:1 -40°C', '01089', '', 'catalog', '1', NULL, NULL, NULL),
(114, '2017-08-22 21:54:00', 'iblock', '72', 0, NULL, NULL, NULL, '=ID=72&EXTERNAL_ID=72&IBLOCK_SECTION_ID=20&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Фильтр топливный MMC MB220900 MMC Pajero 2.5TD 2.8D TD', 'MB220900', '', 'catalog', '1', NULL, NULL, NULL),
(115, '2017-08-22 21:54:00', 'iblock', '73', 0, NULL, NULL, NULL, '=ID=73&EXTERNAL_ID=73&IBLOCK_SECTION_ID=20&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Провода в/в MMC MD311208 MMC Pajero 3.5', 'MD311208', '', 'catalog', '1', NULL, NULL, NULL),
(116, '2017-08-22 21:54:00', 'iblock', '74', 0, NULL, NULL, NULL, '=ID=74&EXTERNAL_ID=74&IBLOCK_SECTION_ID=21&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Свеча зажигания TOYOTA 9091901176 K16RU T.L.Cr.-80 4-Runner', '9091901176', '', 'catalog', '1', NULL, NULL, NULL),
(117, '2017-08-22 21:54:00', 'iblock', '75', 0, NULL, NULL, NULL, '=ID=75&EXTERNAL_ID=75&IBLOCK_SECTION_ID=30&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Лампа MTF Light HVN1203 VANADIUM бело-голубой 5000K 55W 12V комплект 2 ШТ', 'HVN1203', '', 'catalog', '1', NULL, NULL, NULL),
(118, '2017-08-22 21:54:00', 'iblock', '76', 0, NULL, NULL, NULL, '=ID=76&EXTERNAL_ID=76&IBLOCK_SECTION_ID=31&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Коврики а/м NORPLAST NPLPO6312 OPEL CORSA D 06--> полиур-н черн. с борт. компл. 4шт с крепл.', 'NPLPo6312', '', 'catalog', '1', NULL, NULL, NULL),
(119, '2017-08-22 21:54:00', 'iblock', '77', 0, NULL, NULL, NULL, '=ID=77&EXTERNAL_ID=77&IBLOCK_SECTION_ID=30&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Лампа MTF Light H8A1211 ARGENTUM +80% больше света 4000K55W 12V комплект 2 ШТ', 'H8A1211', '', 'catalog', '1', NULL, NULL, NULL),
(120, '2017-08-22 21:54:00', 'iblock', '78', 0, NULL, NULL, NULL, '=ID=78&EXTERNAL_ID=78&IBLOCK_SECTION_ID=32&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Лампа SVS 0210043000 5000K CLASSIC XENON 35W D4S', '0210043000', '', 'catalog', '1', NULL, NULL, NULL),
(121, '2017-08-22 21:54:00', 'iblock', '79', 0, NULL, NULL, NULL, '=ID=79&EXTERNAL_ID=79&IBLOCK_SECTION_ID=33&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Защита двигателя ALFECO 1402 MMC LANCER X 07-->; ASX 1.8 10---> OUTLANDER XL 06--12  /DELICA D5 07--> +  КПП сталь 2мм с крепл.', '1402', '', 'catalog', '1', NULL, NULL, NULL),
(122, '2017-08-22 21:54:00', 'iblock', '80', 0, NULL, NULL, NULL, '=ID=80&EXTERNAL_ID=80&IBLOCK_SECTION_ID=31&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Коврики а/м NORPLAST NPLPO6438 PEUGEOT 308 08-->  полиуретан черн. с борт. компл. 4шт', 'NPLPo6438', '', 'catalog', '1', NULL, NULL, NULL),
(123, '2017-08-22 21:54:00', 'iblock', '81', 0, NULL, NULL, NULL, '=ID=81&EXTERNAL_ID=81&IBLOCK_SECTION_ID=31&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Коврики а/м NORPLAST NPLPO9523 VW JETTA 05--10 полиур. черн. с борт компл. 4 шт. с крепл.', 'NPLPo9523', '', 'catalog', '1', NULL, NULL, NULL),
(124, '2017-08-22 21:54:00', 'iblock', '82', 0, NULL, NULL, NULL, '=ID=82&EXTERNAL_ID=82&IBLOCK_SECTION_ID=34&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Освежитель на дефлектор SLIM SLMV56 Зеленое яблоко 8 мл  жидкий', 'SLMV56', '', 'catalog', '1', NULL, NULL, NULL),
(125, '2017-08-22 21:54:00', 'iblock', '83', 0, NULL, NULL, NULL, '=ID=83&EXTERNAL_ID=83&IBLOCK_SECTION_ID=31&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Коврики а/м NORPLAST NPLPO5621 MB MERCEDES-BENZ W210   95-02 полиуретан черн. с борт. компл 4шт. с крепл.', 'NPLPo5621', '', 'catalog', '1', NULL, NULL, NULL),
(126, '2017-08-22 21:54:00', 'iblock', '84', 0, NULL, NULL, NULL, '=ID=84&EXTERNAL_ID=84&IBLOCK_SECTION_ID=31&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Коврики а/м NORPLAST NPLPO6426 PEUGEOT 206 98--09 полиуретан черн.с борт. компл. 4шт', 'NPLPo6426', '', 'catalog', '1', NULL, NULL, NULL),
(127, '2017-08-22 21:54:00', 'iblock', '85', 0, NULL, NULL, NULL, '=ID=85&EXTERNAL_ID=85&IBLOCK_SECTION_ID=35&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Освежитель подвесной AIR COUTURE AIR5 аромат FAHRENHEIT Cristian Dior', 'AIR5', '', 'catalog', '1', NULL, NULL, NULL),
(128, '2017-08-22 21:54:00', 'iblock', '86', 0, NULL, NULL, NULL, '=ID=86&EXTERNAL_ID=86&IBLOCK_SECTION_ID=36&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Устройство зарядное AIRLINE ACHM01 унив. для моб. телефонов 8 в 1,  12в/24в, шнур -рулетка', 'ACHM01', '', 'catalog', '1', NULL, NULL, NULL),
(129, '2017-08-22 21:54:00', 'iblock', '87', 0, NULL, NULL, NULL, '=ID=87&EXTERNAL_ID=87&IBLOCK_SECTION_ID=35&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Освежитель подвесной AIR COUTURE AIR11 аромат S.T.DUPONT ESSENCE PURE Pour Homme', 'AIR11', '', 'catalog', '1', NULL, NULL, NULL),
(130, '2017-08-22 21:54:00', 'iblock', '88', 0, NULL, NULL, NULL, '=ID=88&EXTERNAL_ID=88&IBLOCK_SECTION_ID=31&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Коврики а/м NORPLAST NPLPO8548 SUZUKI SWIFT 10--> полиуретан черн. с борт. компл. 4шт с крепл.', 'NPLPo8548', '', 'catalog', '1', NULL, NULL, NULL),
(131, '2017-08-22 21:54:00', 'iblock', '89', 0, NULL, NULL, NULL, '=ID=89&EXTERNAL_ID=89&IBLOCK_SECTION_ID=35&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Освежитель подвесной AIR COUTURE AIR3 аромат ACQUA DI GIO Giorgio Armani', 'AIR3', '', 'catalog', '1', NULL, NULL, NULL),
(132, '2017-08-22 21:54:00', 'iblock', '90', 0, NULL, NULL, NULL, '=ID=90&EXTERNAL_ID=90&IBLOCK_SECTION_ID=35&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Освежитель подвесной AIR COUTURE AIR15 аромат CHROME Azzaro', 'AIR15', '', 'catalog', '1', NULL, NULL, NULL),
(133, '2017-08-22 21:54:00', 'iblock', '91', 0, NULL, NULL, NULL, '=ID=91&EXTERNAL_ID=91&IBLOCK_SECTION_ID=31&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Коврики а/м NORPLAST NPLPO1209 CHEVROLET EPICA 06-->полиуретан черн. с борт. крмпл. 4шт с крепл.', 'NPLPo1209', '', 'catalog', '1', NULL, NULL, NULL),
(134, '2017-08-22 21:54:01', 'iblock', '92', 0, NULL, NULL, NULL, '=ID=92&EXTERNAL_ID=92&IBLOCK_SECTION_ID=37&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Коврики а/м AILERON 61501 RENAULT LOGAN 06--14 полиуретан черн. с борт. компл. 4шт', '61501', '', 'catalog', '1', NULL, NULL, NULL),
(135, '2017-08-22 21:54:01', 'iblock', '93', 0, NULL, NULL, NULL, '=ID=93&EXTERNAL_ID=93&IBLOCK_SECTION_ID=38&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Освежитель кондиционера CARMATE D38RU с бактериц. эффектом. Устраняет неприятн. запахи. С ионами серебра. 40мл', 'D38RU', '', 'catalog', '1', NULL, NULL, NULL),
(136, '2017-08-22 21:54:01', 'iblock', '94', 0, NULL, NULL, NULL, '=ID=94&EXTERNAL_ID=94&IBLOCK_SECTION_ID=31&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Коврики а/м NORPLAST NPLPO5948 MMC PAJERO IV  07--> полиуретан черн. с борт. компл. 4 шт. с крепл.', 'NPLPo5948', '', 'catalog', '1', NULL, NULL, NULL),
(137, '2017-08-22 21:54:01', 'iblock', '95', 0, NULL, NULL, NULL, '=ID=95&EXTERNAL_ID=95&IBLOCK_SECTION_ID=39&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Дефлектор SIM SVOTIG0832 окон VW TIGUAN 08--> клеящ. компл. 4шт темн.', 'SVOTIG0832', '', 'catalog', '1', NULL, NULL, NULL),
(138, '2017-08-22 21:54:01', 'iblock', '96', 0, NULL, NULL, NULL, '=ID=96&EXTERNAL_ID=96&IBLOCK_SECTION_ID=31&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Коврики а/м NORPLAST NPLPO0706 BMW X5 E70 07--13/X6 E71; E72 08--> полиуретан черн. с борт. с крепл.', 'NPLPo0706', '', 'catalog', '1', NULL, NULL, NULL),
(139, '2017-08-22 22:37:10', 'iblock', 'S41', 0, NULL, NULL, NULL, '=ID=41&EXTERNAL_ID=&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=rossiya', 'РОССИЯ', '', NULL, 'catalog', '1', NULL, NULL, NULL),
(140, '2017-08-22 21:54:01', 'iblock', '97', 0, NULL, NULL, NULL, '=ID=97&EXTERNAL_ID=97&IBLOCK_SECTION_ID=41&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Знак аварийной остановки РОССИЯ 25724 металл. ДИАЛУЧ соотв. ГОСТ (108104)', '25724', '', 'catalog', '1', NULL, NULL, NULL),
(141, '2017-08-22 22:37:19', 'iblock', 'S42', 0, NULL, NULL, NULL, '=ID=42&EXTERNAL_ID=&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=zebra', 'ЗЕБРА', '', NULL, 'catalog', '1', NULL, NULL, NULL),
(142, '2017-08-22 21:54:01', 'iblock', '98', 0, NULL, NULL, NULL, '=ID=98&EXTERNAL_ID=98&IBLOCK_SECTION_ID=42&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Изолента ЗЕБРА 6320 19мм х 25м черная Китай', '6320', '', 'catalog', '1', NULL, NULL, NULL),
(143, '2017-08-22 22:37:29', 'iblock', 'S43', 0, NULL, NULL, NULL, '=ID=43&EXTERNAL_ID=&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=dialuch', 'ДиаЛУЧ', '', NULL, 'catalog', '1', NULL, NULL, NULL),
(144, '2017-08-22 21:54:01', 'iblock', '99', 0, NULL, NULL, NULL, '=ID=99&EXTERNAL_ID=99&IBLOCK_SECTION_ID=43&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Перчатки рабочие ДиаЛУЧ 25643 а/м белые с ПВХ высш.сорт (2шт)', '25643', '', 'catalog', '1', NULL, NULL, NULL),
(145, '2017-08-22 21:54:01', 'iblock', '100', 0, NULL, NULL, NULL, '=ID=100&EXTERNAL_ID=100&IBLOCK_SECTION_ID=31&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Коврики а/м NORPLAST NPLPO9550 VW TIGUAN 08--> 11--> полиуретан черн. с борт. компл. 4шт с крепл.', 'NPLPO9550', '', 'catalog', '1', NULL, NULL, NULL),
(146, '2017-08-22 21:54:01', 'iblock', '101', 0, NULL, NULL, NULL, '=ID=101&EXTERNAL_ID=101&IBLOCK_SECTION_ID=31&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Коврики а/м NORPLAST NPLPO6310 OPEL ASTRA J 2010--> полиуретан черн. с борт. компл. 4шт с крепл.', 'NPLPo6310', '', 'catalog', '1', NULL, NULL, NULL),
(147, '2017-08-22 21:54:01', 'iblock', '102', 0, NULL, NULL, NULL, '=ID=102&EXTERNAL_ID=102&IBLOCK_SECTION_ID=31&IBLOCK_TYPE_ID=catalog&IBLOCK_ID=1&IBLOCK_CODE=catalog&IBLOCK_EXTERNAL_ID=&CODE=', 'Коврики а/м NORPLAST NPLPO6171 NISSAN TEANA 2008--13 полиуретан черн. с борт. компл. 4шт', 'NPLPo6171', '', 'catalog', '1', NULL, NULL, NULL),
(148, '2017-08-27 20:40:53', 'main', 's1|/news/index.php', 0, NULL, NULL, NULL, '/news/index.php', 'Новости', '', '', '', '', NULL, NULL, NULL),
(149, '2017-08-27 20:51:16', 'main', 's1|/kontakty/index.php', 0, NULL, NULL, NULL, '/kontakty/index.php', 'Контакты', 'Пишите нам по любому вопросу\rОтправить\r+7 (3522) 63-00-68\nКурган, ул. Дзержинского, 68\nwww.автомир45.рф', '', '', '', NULL, NULL, NULL),
(150, '2017-08-27 21:01:28', 'main', 's1|/dostavka/index.php', 0, NULL, NULL, NULL, '/dostavka/index.php', 'Доставка', 'Главная\rНовости\rДоставка курьером\rРавным образом сложившаяся струк- тура организации представляет собой интересный эксперимент проверки направлений прогрессивного развития. Повседневная практика показывает, что реализация намеченных плановых заданий требуют определения и уточнения новых предложений.\rПочта России\rРавным образом сложившаяся струк- тура организации представляет собой интересный эксперимент проверки направлений прогрессивного развития. Повседневная практика показывает, что реализация намеченных плановых заданий требуют определения и уточнения новых предложений.\rСамовывоз из магазина\rРавным образом сложившаяся струк- тура организации представляет собой интересный эксперимент проверки направлений прогрессивного развития. Повседневная практика показывает, что реализация намеченных плановых заданий требуют определения и уточнения новых предложений.', '', '', '', NULL, NULL, NULL),
(151, '2017-08-27 21:07:29', 'main', 's1|/index.php', 0, NULL, NULL, NULL, '/index.php', 'АВТОМИР45', 'Тормозные системы от ведущего производителя\rскидка \r10%\r*\rТормозные системы от ведущего производителя\rскидка \r11%\r*\rТормозные системы от ведущего производителя\rскидка \r12%\r*\rТормозные системы от ведущего производителя\rскидка \r13%\r*\rТормозные системы от ведущего производителя\rскидка \r14%\r*\rТормозные системы от ведущего производителя\rскидка \r15%\r*\rНовости\rРемонт своими руками\rРавным образом сложившаяся струк- тура организации представляет собой интересный эксперимент проверки направлений прогрессивного развития. Повседневная практика показывает, что реализация намеченных плановых заданий требуют определения и уточнения новых предложений.\nЧитать далее...\rРемонт своими руками\rРавным образом сложившаяся струк- тура организации представляет собой интересный эксперимент проверки направлений прогрессивного развития. Повседневная практика показывает, что реализация намеченных плановых заданий требуют определения и уточнения новых предложений.\nЧитать далее...\rРемонт своими руками\rРавным образом сложившаяся струк- тура организации представляет собой интересный эксперимент проверки направлений прогрессивного развития. Повседневная практика показывает, что реализация намеченных плановых заданий требуют определения и уточнения новых предложений.\nЧитать далее...\rСпециальные предложения', '', '', '', NULL, NULL, NULL),
(152, '2017-08-27 21:34:14', 'main', 's1|/vin/index.php', 0, NULL, NULL, NULL, '/vin/index.php', 'Запрос по VIN', 'Главная\rЗапрос\rОтправьте нам запрос и менеджер свяжеться с вами\rРемонт своими руками\rРавным образом сложившаяся структура организации представляет собой интересный эксперимент проверки направлений прогрессивного развития. Повседневная практика показывает, что реализация намеченных плановых заданий требуют определения и уточнения новых предложений.', '', '', '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_freq`
--

CREATE TABLE `b_search_content_freq` (
  `STEM` int(11) NOT NULL DEFAULT '0',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FREQ` float DEFAULT NULL,
  `TF` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_param`
--

CREATE TABLE `b_search_content_param` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `PARAM_NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `PARAM_VALUE` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_right`
--

CREATE TABLE `b_search_content_right` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_search_content_right`
--

INSERT INTO `b_search_content_right` (`SEARCH_CONTENT_ID`, `GROUP_CODE`) VALUES
(5, 'G2'),
(6, 'G2'),
(7, 'G2'),
(24, 'G1'),
(24, 'G2'),
(26, 'G1'),
(26, 'G2'),
(27, 'G1'),
(27, 'G2'),
(28, 'G1'),
(28, 'G2'),
(29, 'G1'),
(29, 'G2'),
(30, 'G1'),
(30, 'G2'),
(31, 'G1'),
(31, 'G2'),
(32, 'G1'),
(32, 'G2'),
(33, 'G1'),
(33, 'G2'),
(34, 'G1'),
(34, 'G2'),
(35, 'G1'),
(35, 'G2'),
(36, 'G1'),
(36, 'G2'),
(37, 'G1'),
(37, 'G2'),
(38, 'G1'),
(38, 'G2'),
(39, 'G1'),
(39, 'G2'),
(40, 'G1'),
(40, 'G2'),
(41, 'G1'),
(41, 'G2'),
(42, 'G1'),
(42, 'G2'),
(43, 'G1'),
(43, 'G2'),
(44, 'G1'),
(44, 'G2'),
(45, 'G1'),
(45, 'G2'),
(46, 'G1'),
(46, 'G2'),
(47, 'G1'),
(47, 'G2'),
(48, 'G1'),
(48, 'G2'),
(49, 'G1'),
(49, 'G2'),
(50, 'G1'),
(50, 'G2'),
(51, 'G1'),
(51, 'G2'),
(52, 'G1'),
(52, 'G2'),
(53, 'G1'),
(53, 'G2'),
(54, 'G1'),
(54, 'G2'),
(55, 'G1'),
(55, 'G2'),
(56, 'G1'),
(56, 'G2'),
(57, 'G1'),
(57, 'G2'),
(58, 'G1'),
(58, 'G2'),
(59, 'G1'),
(59, 'G2'),
(60, 'G1'),
(60, 'G2'),
(61, 'G1'),
(61, 'G2'),
(62, 'G1'),
(62, 'G2'),
(63, 'G1'),
(63, 'G2'),
(64, 'G1'),
(64, 'G2'),
(65, 'G1'),
(65, 'G2'),
(66, 'G1'),
(66, 'G2'),
(67, 'G1'),
(67, 'G2'),
(68, 'G1'),
(68, 'G2'),
(69, 'G1'),
(69, 'G2'),
(70, 'G1'),
(70, 'G2'),
(71, 'G1'),
(71, 'G2'),
(72, 'G1'),
(72, 'G2'),
(73, 'G1'),
(73, 'G2'),
(74, 'G1'),
(74, 'G2'),
(75, 'G1'),
(75, 'G2'),
(76, 'G1'),
(76, 'G2'),
(77, 'G1'),
(77, 'G2'),
(78, 'G1'),
(78, 'G2'),
(79, 'G1'),
(79, 'G2'),
(80, 'G1'),
(80, 'G2'),
(81, 'G1'),
(81, 'G2'),
(82, 'G1'),
(82, 'G2'),
(83, 'G1'),
(83, 'G2'),
(84, 'G1'),
(84, 'G2'),
(85, 'G1'),
(85, 'G2'),
(86, 'G1'),
(86, 'G2'),
(87, 'G1'),
(87, 'G2'),
(88, 'G1'),
(88, 'G2'),
(89, 'G1'),
(89, 'G2'),
(90, 'G1'),
(90, 'G2'),
(91, 'G1'),
(91, 'G2'),
(92, 'G1'),
(92, 'G2'),
(93, 'G1'),
(93, 'G2'),
(94, 'G1'),
(94, 'G2'),
(95, 'G1'),
(95, 'G2'),
(96, 'G1'),
(96, 'G2'),
(97, 'G1'),
(97, 'G2'),
(98, 'G1'),
(98, 'G2'),
(99, 'G1'),
(99, 'G2'),
(100, 'G1'),
(100, 'G2'),
(101, 'G1'),
(101, 'G2'),
(102, 'G1'),
(102, 'G2'),
(103, 'G1'),
(103, 'G2'),
(104, 'G1'),
(104, 'G2'),
(105, 'G1'),
(105, 'G2'),
(106, 'G1'),
(106, 'G2'),
(107, 'G1'),
(107, 'G2'),
(108, 'G1'),
(108, 'G2'),
(109, 'G1'),
(109, 'G2'),
(110, 'G1'),
(110, 'G2'),
(111, 'G1'),
(111, 'G2'),
(112, 'G1'),
(112, 'G2'),
(113, 'G1'),
(113, 'G2'),
(114, 'G1'),
(114, 'G2'),
(115, 'G1'),
(115, 'G2'),
(116, 'G1'),
(116, 'G2'),
(117, 'G1'),
(117, 'G2'),
(118, 'G1'),
(118, 'G2'),
(119, 'G1'),
(119, 'G2'),
(120, 'G1'),
(120, 'G2'),
(121, 'G1'),
(121, 'G2'),
(122, 'G1'),
(122, 'G2'),
(123, 'G1'),
(123, 'G2'),
(124, 'G1'),
(124, 'G2'),
(125, 'G1'),
(125, 'G2'),
(126, 'G1'),
(126, 'G2'),
(127, 'G1'),
(127, 'G2'),
(128, 'G1'),
(128, 'G2'),
(129, 'G1'),
(129, 'G2'),
(130, 'G1'),
(130, 'G2'),
(131, 'G1'),
(131, 'G2'),
(132, 'G1'),
(132, 'G2'),
(133, 'G1'),
(133, 'G2'),
(134, 'G1'),
(134, 'G2'),
(135, 'G1'),
(135, 'G2'),
(136, 'G1'),
(136, 'G2'),
(137, 'G1'),
(137, 'G2'),
(138, 'G1'),
(138, 'G2'),
(139, 'G1'),
(139, 'G2'),
(140, 'G1'),
(140, 'G2'),
(141, 'G1'),
(141, 'G2'),
(142, 'G1'),
(142, 'G2'),
(143, 'G1'),
(143, 'G2'),
(144, 'G1'),
(144, 'G2'),
(145, 'G1'),
(145, 'G2'),
(146, 'G1'),
(146, 'G2'),
(147, 'G1'),
(147, 'G2'),
(148, 'G2'),
(149, 'G2'),
(150, 'G2'),
(151, 'G2'),
(152, 'G2');

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_site`
--

CREATE TABLE `b_search_content_site` (
  `SEARCH_CONTENT_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `URL` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_search_content_site`
--

INSERT INTO `b_search_content_site` (`SEARCH_CONTENT_ID`, `SITE_ID`, `URL`) VALUES
(5, 's1', ''),
(6, 's1', ''),
(7, 's1', ''),
(24, 's1', ''),
(26, 's1', ''),
(27, 's1', ''),
(28, 's1', ''),
(29, 's1', ''),
(30, 's1', ''),
(31, 's1', ''),
(32, 's1', ''),
(33, 's1', ''),
(34, 's1', ''),
(35, 's1', ''),
(36, 's1', ''),
(37, 's1', ''),
(38, 's1', ''),
(39, 's1', ''),
(40, 's1', ''),
(41, 's1', ''),
(42, 's1', ''),
(43, 's1', ''),
(44, 's1', ''),
(45, 's1', ''),
(46, 's1', ''),
(47, 's1', ''),
(48, 's1', ''),
(49, 's1', ''),
(50, 's1', ''),
(51, 's1', ''),
(52, 's1', ''),
(53, 's1', ''),
(54, 's1', ''),
(55, 's1', ''),
(56, 's1', ''),
(57, 's1', ''),
(58, 's1', ''),
(59, 's1', ''),
(60, 's1', ''),
(61, 's1', ''),
(62, 's1', ''),
(63, 's1', ''),
(64, 's1', ''),
(65, 's1', ''),
(66, 's1', ''),
(67, 's1', ''),
(68, 's1', ''),
(69, 's1', ''),
(70, 's1', ''),
(71, 's1', ''),
(72, 's1', ''),
(73, 's1', ''),
(74, 's1', ''),
(75, 's1', ''),
(76, 's1', ''),
(77, 's1', ''),
(78, 's1', ''),
(79, 's1', ''),
(80, 's1', ''),
(81, 's1', ''),
(82, 's1', ''),
(83, 's1', ''),
(84, 's1', ''),
(85, 's1', ''),
(86, 's1', ''),
(87, 's1', ''),
(88, 's1', ''),
(89, 's1', ''),
(90, 's1', ''),
(91, 's1', ''),
(92, 's1', ''),
(93, 's1', ''),
(94, 's1', ''),
(95, 's1', ''),
(96, 's1', ''),
(97, 's1', ''),
(98, 's1', ''),
(99, 's1', ''),
(100, 's1', ''),
(101, 's1', ''),
(102, 's1', ''),
(103, 's1', ''),
(104, 's1', ''),
(105, 's1', ''),
(106, 's1', ''),
(107, 's1', ''),
(108, 's1', ''),
(109, 's1', ''),
(110, 's1', ''),
(111, 's1', ''),
(112, 's1', ''),
(113, 's1', ''),
(114, 's1', ''),
(115, 's1', ''),
(116, 's1', ''),
(117, 's1', ''),
(118, 's1', ''),
(119, 's1', ''),
(120, 's1', ''),
(121, 's1', ''),
(122, 's1', ''),
(123, 's1', ''),
(124, 's1', ''),
(125, 's1', ''),
(126, 's1', ''),
(127, 's1', ''),
(128, 's1', ''),
(129, 's1', ''),
(130, 's1', ''),
(131, 's1', ''),
(132, 's1', ''),
(133, 's1', ''),
(134, 's1', ''),
(135, 's1', ''),
(136, 's1', ''),
(137, 's1', ''),
(138, 's1', ''),
(139, 's1', ''),
(140, 's1', ''),
(141, 's1', ''),
(142, 's1', ''),
(143, 's1', ''),
(144, 's1', ''),
(145, 's1', ''),
(146, 's1', ''),
(147, 's1', ''),
(148, 's1', ''),
(149, 's1', ''),
(150, 's1', ''),
(151, 's1', ''),
(152, 's1', '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_stem`
--

CREATE TABLE `b_search_content_stem` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `STEM` int(11) NOT NULL,
  `TF` float NOT NULL,
  `PS` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

--
-- Дамп данных таблицы `b_search_content_stem`
--

INSERT INTO `b_search_content_stem` (`SEARCH_CONTENT_ID`, `LANGUAGE_ID`, `STEM`, `TF`, `PS`) VALUES
(5, 'ru', 4, 0.2314, 3),
(5, 'ru', 7, 0.2314, 2),
(5, 'ru', 9, 0.3667, 2.5),
(5, 'ru', 78, 0.2314, 5),
(6, 'ru', 4, 0.2314, 3),
(6, 'ru', 7, 0.2314, 2),
(6, 'ru', 8, 0.6941, 7.4286),
(6, 'ru', 9, 0.2314, 4),
(6, 'ru', 77, 0.2314, 5),
(7, 'ru', 4, 0.2211, 3),
(7, 'ru', 7, 0.2211, 2),
(7, 'ru', 9, 0.3504, 2.5),
(7, 'ru', 10, 0.7344, 14),
(7, 'ru', 78, 0.2211, 5),
(7, 'ru', 79, 0.7344, 15),
(24, 'ru', 1, 0.2314, 1),
(26, 'ru', 2, 0.2314, 1),
(27, 'ru', 3, 0.2314, 1),
(28, 'ru', 81, 0.2314, 1),
(29, 'ru', 82, 0.2314, 1),
(30, 'ru', 83, 0.2314, 1),
(31, 'ru', 84, 0.2314, 1),
(32, 'ru', 85, 0.2314, 1),
(33, 'ru', 86, 0.2314, 1),
(34, 'ru', 87, 0.2314, 1),
(35, 'ru', 88, 0.2314, 1),
(36, 'ru', 89, 0.2314, 1),
(36, 'ru', 90, 0.2314, 2),
(37, 'ru', 91, 0.2314, 1),
(38, 'ru', 92, 0.2314, 1),
(39, 'ru', 93, 0.2314, 1),
(40, 'ru', 94, 0.2314, 1),
(41, 'ru', 95, 0.2314, 1),
(41, 'ru', 96, 0.2314, 2),
(42, 'ru', 97, 0.2314, 1),
(43, 'ru', 98, 0.2314, 1),
(44, 'ru', 99, 0.2314, 1),
(45, 'ru', 100, 0.2314, 1),
(46, 'ru', 1, 0.2314, 3),
(46, 'ru', 2, 0.2314, 5),
(46, 'ru', 80, 0.3667, 9),
(46, 'ru', 101, 0.2314, 1),
(46, 'ru', 102, 0.2314, 2),
(46, 'ru', 103, 0.2314, 6),
(46, 'ru', 104, 0.2314, 13),
(47, 'ru', 1, 0.2314, 3),
(47, 'ru', 2, 0.2314, 5),
(47, 'ru', 101, 0.2314, 1),
(47, 'ru', 102, 0.2314, 2),
(47, 'ru', 103, 0.2314, 6),
(47, 'ru', 105, 0.3667, 9),
(47, 'ru', 106, 0.2314, 13),
(48, 'ru', 1, 0.2314, 3),
(48, 'ru', 2, 0.2314, 5),
(48, 'ru', 101, 0.2314, 1),
(48, 'ru', 102, 0.2314, 2),
(48, 'ru', 103, 0.2314, 6),
(48, 'ru', 106, 0.2314, 13),
(48, 'ru', 107, 0.4628, 11),
(49, 'ru', 1, 0.2314, 3),
(49, 'ru', 2, 0.2314, 5),
(49, 'ru', 101, 0.2314, 1),
(49, 'ru', 103, 0.2314, 6),
(49, 'ru', 104, 0.2314, 13),
(49, 'ru', 108, 0.2314, 2),
(49, 'ru', 109, 0.3667, 9),
(50, 'ru', 1, 0.2314, 3),
(50, 'ru', 2, 0.2314, 5),
(50, 'ru', 101, 0.2314, 1),
(50, 'ru', 102, 0.2314, 2),
(50, 'ru', 103, 0.2314, 6),
(50, 'ru', 104, 0.2314, 13),
(50, 'ru', 110, 0.3667, 9.5),
(50, 'ru', 111, 0.2314, 14),
(51, 'ru', 1, 0.2314, 3),
(51, 'ru', 3, 0.2314, 5),
(51, 'ru', 101, 0.2314, 1),
(51, 'ru', 108, 0.2314, 2),
(51, 'ru', 112, 0.3667, 15),
(51, 'ru', 113, 0.2314, 12),
(51, 'ru', 114, 0.2314, 18),
(51, 'ru', 115, 0.2314, 25),
(52, 'ru', 1, 0.2314, 3),
(52, 'ru', 2, 0.2314, 5),
(52, 'ru', 101, 0.2314, 1),
(52, 'ru', 103, 0.2314, 6),
(52, 'ru', 104, 0.2314, 13),
(52, 'ru', 116, 0.2314, 2),
(52, 'ru', 117, 0.3667, 9.5),
(52, 'ru', 118, 0.2314, 14),
(53, 'ru', 2, 0.3667, 4),
(53, 'ru', 101, 0.2314, 1),
(53, 'ru', 103, 0.2314, 6),
(53, 'ru', 116, 0.2314, 2),
(53, 'ru', 118, 0.2314, 14),
(53, 'ru', 119, 0.3667, 10),
(53, 'ru', 120, 0.2314, 15),
(54, 'ru', 2, 0.3667, 4),
(54, 'ru', 101, 0.2314, 1),
(54, 'ru', 103, 0.2314, 6),
(54, 'ru', 116, 0.2314, 2),
(54, 'ru', 120, 0.2314, 15),
(54, 'ru', 121, 0.3667, 10),
(54, 'ru', 122, 0.2314, 14),
(55, 'ru', 3, 0.2314, 3),
(55, 'ru', 101, 0.2314, 1),
(55, 'ru', 113, 0.2314, 14),
(55, 'ru', 114, 0.2314, 20),
(55, 'ru', 116, 0.2314, 2),
(55, 'ru', 123, 0.3667, 14),
(55, 'ru', 124, 0.2314, 5),
(55, 'ru', 125, 0.2314, 6),
(55, 'ru', 126, 0.2314, 21),
(55, 'ru', 127, 0.2314, 22),
(55, 'ru', 128, 0.2314, 23),
(56, 'ru', 1, 0.2314, 3),
(56, 'ru', 2, 0.2314, 5),
(56, 'ru', 101, 0.2314, 1),
(56, 'ru', 103, 0.2314, 6),
(56, 'ru', 104, 0.2314, 13),
(56, 'ru', 106, 0.2314, 20),
(56, 'ru', 108, 0.2314, 2),
(56, 'ru', 129, 0.3667, 12.5),
(57, 'ru', 1, 0.2314, 3),
(57, 'ru', 3, 0.2314, 5),
(57, 'ru', 101, 0.2314, 1),
(57, 'ru', 108, 0.2314, 2),
(57, 'ru', 130, 0.3667, 12.5),
(57, 'ru', 131, 0.2314, 6),
(57, 'ru', 132, 0.2314, 20),
(58, 'ru', 1, 0.2314, 3),
(58, 'ru', 3, 0.2314, 5),
(58, 'ru', 101, 0.2314, 1),
(58, 'ru', 108, 0.2314, 2),
(58, 'ru', 113, 0.2314, 12),
(58, 'ru', 114, 0.2314, 18),
(58, 'ru', 115, 0.2314, 25),
(58, 'ru', 133, 0.3667, 15),
(59, 'ru', 81, 0.2314, 2),
(59, 'ru', 134, 0.2314, 1),
(59, 'ru', 135, 0.3667, 21.5),
(59, 'ru', 136, 0.2314, 4),
(59, 'ru', 137, 0.2314, 5),
(59, 'ru', 138, 0.3667, 28.5),
(59, 'ru', 139, 0.2314, 27),
(59, 'ru', 140, 0.2314, 28),
(59, 'ru', 141, 0.2314, 29),
(59, 'ru', 142, 0.2314, 30),
(59, 'ru', 143, 0.2314, 31),
(59, 'ru', 144, 0.2314, 39),
(60, 'ru', 82, 0.2314, 2),
(60, 'ru', 145, 0.2314, 1),
(60, 'ru', 146, 0.3667, 5.5),
(60, 'ru', 147, 0.2314, 4),
(60, 'ru', 148, 0.2314, 5),
(60, 'ru', 149, 0.2314, 6),
(61, 'ru', 2, 0.3667, 3),
(61, 'ru', 103, 0.2314, 5),
(61, 'ru', 150, 0.2314, 1),
(61, 'ru', 151, 0.3667, 5.5),
(61, 'ru', 152, 0.2314, 6),
(62, 'ru', 3, 0.2314, 2),
(62, 'ru', 153, 0.2314, 1),
(62, 'ru', 154, 0.3667, 13.5),
(62, 'ru', 155, 0.2314, 5),
(62, 'ru', 156, 0.2314, 11),
(62, 'ru', 157, 0.2314, 12),
(62, 'ru', 158, 0.2314, 18),
(63, 'ru', 3, 0.3667, 3),
(63, 'ru', 113, 0.2314, 11),
(63, 'ru', 153, 0.2314, 1),
(63, 'ru', 157, 0.2314, 18),
(63, 'ru', 159, 0.3667, 13.5),
(63, 'ru', 160, 0.2314, 17),
(64, 'ru', 2, 0.2314, 3),
(64, 'ru', 103, 0.2314, 5),
(64, 'ru', 161, 0.2314, 1),
(64, 'ru', 162, 0.2314, 2),
(64, 'ru', 163, 0.3667, 5.5),
(64, 'ru', 164, 0.2314, 6),
(65, 'ru', 2, 0.2314, 3),
(65, 'ru', 103, 0.2314, 5),
(65, 'ru', 111, 0.2314, 6),
(65, 'ru', 161, 0.2314, 1),
(65, 'ru', 162, 0.2314, 2),
(65, 'ru', 165, 0.3667, 5.5),
(66, 'ru', 2, 0.2314, 3),
(66, 'ru', 103, 0.2314, 5),
(66, 'ru', 111, 0.2314, 6),
(66, 'ru', 161, 0.2314, 1),
(66, 'ru', 162, 0.2314, 2),
(66, 'ru', 166, 0.3667, 5.5),
(67, 'ru', 2, 0.2314, 8),
(67, 'ru', 103, 0.2314, 16),
(67, 'ru', 167, 0.2314, 1),
(67, 'ru', 168, 0.2314, 2),
(67, 'ru', 169, 0.3667, 14),
(67, 'ru', 170, 0.2314, 17),
(67, 'ru', 171, 0.2314, 18),
(68, 'ru', 83, 0.2314, 8),
(68, 'ru', 161, 0.2314, 1),
(68, 'ru', 168, 0.2314, 2),
(68, 'ru', 171, 0.2314, 11),
(68, 'ru', 172, 0.3667, 13),
(68, 'ru', 173, 0.2314, 10),
(69, 'ru', 83, 0.2314, 8),
(69, 'ru', 161, 0.2314, 1),
(69, 'ru', 168, 0.2314, 2),
(69, 'ru', 171, 0.2314, 12),
(69, 'ru', 174, 0.3667, 14.5),
(69, 'ru', 175, 0.2314, 10),
(69, 'ru', 176, 0.2314, 11),
(69, 'ru', 177, 0.2314, 18),
(69, 'ru', 178, 0.2314, 19),
(70, 'ru', 3, 0.2314, 8),
(70, 'ru', 161, 0.2314, 1),
(70, 'ru', 168, 0.2314, 2),
(70, 'ru', 171, 0.2314, 14),
(70, 'ru', 179, 0.3667, 14.5),
(70, 'ru', 180, 0.2314, 10),
(70, 'ru', 181, 0.2314, 12),
(70, 'ru', 182, 0.2314, 13),
(71, 'ru', 3, 0.2314, 8),
(71, 'ru', 114, 0.2314, 18),
(71, 'ru', 161, 0.2314, 1),
(71, 'ru', 168, 0.2314, 2),
(71, 'ru', 171, 0.2314, 21),
(71, 'ru', 180, 0.2314, 10),
(71, 'ru', 183, 0.3667, 18),
(71, 'ru', 184, 0.2314, 11),
(71, 'ru', 185, 0.2314, 17),
(71, 'ru', 186, 0.2314, 19),
(71, 'ru', 187, 0.2314, 20),
(72, 'ru', 3, 0.2314, 8),
(72, 'ru', 161, 0.2314, 1),
(72, 'ru', 168, 0.2314, 2),
(72, 'ru', 171, 0.2314, 12),
(72, 'ru', 188, 0.3667, 13.5),
(72, 'ru', 189, 0.2314, 10),
(72, 'ru', 190, 0.2314, 11),
(73, 'ru', 2, 0.2314, 9),
(73, 'ru', 103, 0.2314, 11),
(73, 'ru', 111, 0.2314, 12),
(73, 'ru', 161, 0.2314, 1),
(73, 'ru', 168, 0.2314, 2),
(73, 'ru', 191, 0.2314, 8),
(73, 'ru', 192, 0.3667, 13),
(73, 'ru', 193, 0.2314, 13),
(73, 'ru', 194, 0.2314, 14),
(73, 'ru', 195, 0.2314, 15),
(74, 'ru', 83, 0.2314, 9),
(74, 'ru', 161, 0.2314, 1),
(74, 'ru', 168, 0.2314, 2),
(74, 'ru', 175, 0.2314, 11),
(74, 'ru', 191, 0.2314, 8),
(74, 'ru', 196, 0.3667, 11.5),
(74, 'ru', 197, 0.2314, 12),
(75, 'ru', 3, 0.2314, 9),
(75, 'ru', 114, 0.2314, 18),
(75, 'ru', 161, 0.2314, 1),
(75, 'ru', 168, 0.2314, 2),
(75, 'ru', 184, 0.2314, 11),
(75, 'ru', 185, 0.2314, 17),
(75, 'ru', 191, 0.2314, 8),
(75, 'ru', 198, 0.3667, 14.5),
(76, 'ru', 3, 0.2314, 9),
(76, 'ru', 155, 0.2314, 12),
(76, 'ru', 161, 0.2314, 1),
(76, 'ru', 168, 0.2314, 2),
(76, 'ru', 191, 0.2314, 8),
(76, 'ru', 199, 0.3667, 12),
(76, 'ru', 200, 0.2314, 13),
(77, 'ru', 3, 0.2314, 9),
(77, 'ru', 161, 0.2314, 1),
(77, 'ru', 168, 0.2314, 2),
(77, 'ru', 191, 0.2314, 8),
(77, 'ru', 201, 0.3667, 11.5),
(77, 'ru', 202, 0.2314, 12),
(78, 'ru', 2, 0.2314, 8),
(78, 'ru', 103, 0.2314, 10),
(78, 'ru', 111, 0.2314, 11),
(78, 'ru', 157, 0.2314, 12),
(78, 'ru', 161, 0.2314, 1),
(78, 'ru', 168, 0.2314, 2),
(78, 'ru', 203, 0.3667, 13.5),
(79, 'ru', 2, 0.2314, 8),
(79, 'ru', 103, 0.2314, 10),
(79, 'ru', 111, 0.2314, 11),
(79, 'ru', 157, 0.2314, 12),
(79, 'ru', 161, 0.2314, 1),
(79, 'ru', 168, 0.2314, 2),
(79, 'ru', 204, 0.3667, 13.5),
(80, 'ru', 2, 0.2314, 8),
(80, 'ru', 103, 0.2314, 10),
(80, 'ru', 124, 0.2314, 13),
(80, 'ru', 157, 0.2314, 14),
(80, 'ru', 161, 0.2314, 1),
(80, 'ru', 168, 0.2314, 2),
(80, 'ru', 205, 0.3667, 14.5),
(80, 'ru', 206, 0.2314, 12),
(81, 'ru', 83, 0.2314, 8),
(81, 'ru', 157, 0.2314, 18),
(81, 'ru', 161, 0.2314, 1),
(81, 'ru', 168, 0.2314, 2),
(81, 'ru', 197, 0.2314, 10),
(81, 'ru', 207, 0.3667, 16.5),
(81, 'ru', 208, 0.2314, 17),
(82, 'ru', 83, 0.2314, 8),
(82, 'ru', 104, 0.2314, 24),
(82, 'ru', 157, 0.2314, 33),
(82, 'ru', 161, 0.2314, 1),
(82, 'ru', 168, 0.2314, 2),
(82, 'ru', 197, 0.2314, 10),
(82, 'ru', 208, 0.2314, 17),
(82, 'ru', 209, 0.3667, 24),
(82, 'ru', 210, 0.2314, 31),
(82, 'ru', 211, 0.2314, 32),
(83, 'ru', 83, 0.3667, 9),
(83, 'ru', 157, 0.2314, 13),
(83, 'ru', 161, 0.2314, 1),
(83, 'ru', 168, 0.2314, 2),
(83, 'ru', 197, 0.2314, 11),
(83, 'ru', 212, 0.3667, 14),
(83, 'ru', 213, 0.2314, 12),
(84, 'ru', 83, 0.2314, 8),
(84, 'ru', 157, 0.2314, 12),
(84, 'ru', 161, 0.2314, 1),
(84, 'ru', 168, 0.2314, 2),
(84, 'ru', 175, 0.2314, 10),
(84, 'ru', 176, 0.2314, 11),
(84, 'ru', 214, 0.3667, 13.5),
(85, 'ru', 3, 0.2314, 8),
(85, 'ru', 126, 0.2314, 18),
(85, 'ru', 161, 0.2314, 1),
(85, 'ru', 168, 0.2314, 2),
(85, 'ru', 184, 0.2314, 11),
(85, 'ru', 185, 0.2314, 17),
(85, 'ru', 215, 0.3667, 17),
(85, 'ru', 216, 0.2314, 10),
(85, 'ru', 217, 0.2314, 19),
(86, 'ru', 3, 0.2314, 8),
(86, 'ru', 114, 0.2314, 18),
(86, 'ru', 157, 0.2314, 19),
(86, 'ru', 161, 0.2314, 1),
(86, 'ru', 168, 0.2314, 2),
(86, 'ru', 184, 0.2314, 11),
(86, 'ru', 185, 0.2314, 17),
(86, 'ru', 218, 0.3667, 17),
(86, 'ru', 219, 0.2314, 10),
(87, 'ru', 3, 0.2314, 8),
(87, 'ru', 157, 0.2314, 13),
(87, 'ru', 161, 0.2314, 1),
(87, 'ru', 168, 0.2314, 2),
(87, 'ru', 220, 0.3667, 14),
(87, 'ru', 221, 0.2314, 10),
(87, 'ru', 222, 0.2314, 11),
(88, 'ru', 3, 0.2314, 8),
(88, 'ru', 157, 0.2314, 14),
(88, 'ru', 161, 0.2314, 1),
(88, 'ru', 168, 0.2314, 2),
(88, 'ru', 182, 0.2314, 13),
(88, 'ru', 202, 0.2314, 12),
(88, 'ru', 223, 0.3667, 14.5),
(88, 'ru', 224, 0.2314, 10),
(89, 'ru', 3, 0.2314, 8),
(89, 'ru', 113, 0.2314, 17),
(89, 'ru', 114, 0.2314, 23),
(89, 'ru', 157, 0.2314, 24),
(89, 'ru', 161, 0.2314, 1),
(89, 'ru', 168, 0.2314, 2),
(89, 'ru', 184, 0.2314, 11),
(89, 'ru', 225, 0.3667, 19.5),
(89, 'ru', 226, 0.2314, 10),
(90, 'ru', 3, 0.2314, 8),
(90, 'ru', 113, 0.2314, 17),
(90, 'ru', 114, 0.2314, 23),
(90, 'ru', 157, 0.2314, 24),
(90, 'ru', 161, 0.2314, 1),
(90, 'ru', 168, 0.2314, 2),
(90, 'ru', 184, 0.2314, 11),
(90, 'ru', 219, 0.2314, 10),
(90, 'ru', 227, 0.3667, 19.5),
(91, 'ru', 3, 0.2314, 8),
(91, 'ru', 113, 0.2314, 17),
(91, 'ru', 114, 0.2314, 23),
(91, 'ru', 157, 0.2314, 24),
(91, 'ru', 161, 0.2314, 1),
(91, 'ru', 168, 0.2314, 2),
(91, 'ru', 184, 0.2314, 11),
(91, 'ru', 228, 0.3667, 19.5),
(91, 'ru', 229, 0.2314, 10),
(92, 'ru', 3, 0.2314, 8),
(92, 'ru', 113, 0.2314, 17),
(92, 'ru', 126, 0.2314, 23),
(92, 'ru', 157, 0.2314, 24),
(92, 'ru', 161, 0.2314, 1),
(92, 'ru', 168, 0.2314, 2),
(92, 'ru', 184, 0.2314, 11),
(92, 'ru', 224, 0.2314, 10),
(92, 'ru', 230, 0.3667, 19.5),
(93, 'ru', 2, 0.2314, 8),
(93, 'ru', 103, 0.2314, 10),
(93, 'ru', 152, 0.2314, 12),
(93, 'ru', 157, 0.2314, 13),
(93, 'ru', 167, 0.2314, 1),
(93, 'ru', 168, 0.2314, 2),
(93, 'ru', 231, 0.3667, 14.5),
(94, 'ru', 2, 0.2314, 8),
(94, 'ru', 103, 0.2314, 10),
(94, 'ru', 152, 0.2314, 12),
(94, 'ru', 157, 0.2314, 13),
(94, 'ru', 167, 0.2314, 1),
(94, 'ru', 168, 0.2314, 2),
(94, 'ru', 232, 0.3667, 14.5),
(95, 'ru', 2, 0.3667, 4),
(95, 'ru', 103, 0.2314, 6),
(95, 'ru', 111, 0.2314, 7),
(95, 'ru', 233, 0.2314, 1),
(95, 'ru', 234, 0.2314, 2),
(95, 'ru', 235, 0.3667, 9.5),
(95, 'ru', 236, 0.2314, 8),
(96, 'ru', 2, 0.3667, 4),
(96, 'ru', 103, 0.2314, 6),
(96, 'ru', 111, 0.2314, 7),
(96, 'ru', 233, 0.2314, 1),
(96, 'ru', 234, 0.2314, 2),
(96, 'ru', 236, 0.2314, 8),
(96, 'ru', 237, 0.3667, 9.5),
(97, 'ru', 2, 0.3667, 4),
(97, 'ru', 103, 0.2314, 6),
(97, 'ru', 111, 0.2314, 7),
(97, 'ru', 233, 0.2314, 1),
(97, 'ru', 234, 0.2314, 2),
(97, 'ru', 238, 0.3667, 9.5),
(97, 'ru', 239, 0.2314, 8),
(98, 'ru', 2, 0.3667, 4),
(98, 'ru', 103, 0.2314, 6),
(98, 'ru', 111, 0.2314, 7),
(98, 'ru', 233, 0.2314, 1),
(98, 'ru', 234, 0.2314, 2),
(98, 'ru', 239, 0.2314, 8),
(98, 'ru', 240, 0.3667, 9.5),
(99, 'ru', 2, 0.2314, 3),
(99, 'ru', 103, 0.2314, 11),
(99, 'ru', 111, 0.2314, 12),
(99, 'ru', 157, 0.2314, 13),
(99, 'ru', 239, 0.2314, 19),
(99, 'ru', 241, 0.2314, 2),
(99, 'ru', 242, 0.3667, 17.5),
(99, 'ru', 243, 0.2314, 25),
(100, 'ru', 2, 0.2314, 3),
(100, 'ru', 103, 0.2314, 11),
(100, 'ru', 152, 0.2314, 13),
(100, 'ru', 171, 0.2314, 14),
(100, 'ru', 241, 0.2314, 2),
(100, 'ru', 243, 0.2314, 20),
(100, 'ru', 244, 0.3667, 15),
(100, 'ru', 245, 0.2314, 12),
(101, 'ru', 2, 0.2314, 3),
(101, 'ru', 103, 0.2314, 11),
(101, 'ru', 152, 0.2314, 13),
(101, 'ru', 171, 0.2314, 14),
(101, 'ru', 241, 0.2314, 2),
(101, 'ru', 243, 0.2314, 20),
(101, 'ru', 246, 0.3667, 15),
(102, 'ru', 3, 0.2314, 5),
(102, 'ru', 84, 0.2314, 3),
(102, 'ru', 247, 0.2314, 1),
(102, 'ru', 248, 0.2314, 2),
(102, 'ru', 249, 0.3667, 8.5),
(102, 'ru', 250, 0.2314, 6),
(102, 'ru', 251, 0.2314, 7),
(103, 'ru', 3, 0.2314, 3),
(103, 'ru', 113, 0.2314, 11),
(103, 'ru', 114, 0.2314, 17),
(103, 'ru', 247, 0.2314, 1),
(103, 'ru', 248, 0.2314, 2),
(103, 'ru', 252, 0.3667, 11.5),
(104, 'ru', 3, 0.2314, 3),
(104, 'ru', 113, 0.2314, 11),
(104, 'ru', 114, 0.2314, 17),
(104, 'ru', 247, 0.2314, 1),
(104, 'ru', 248, 0.2314, 2),
(104, 'ru', 253, 0.3667, 11.5),
(105, 'ru', 85, 0.3667, 4),
(105, 'ru', 254, 0.2314, 1),
(105, 'ru', 255, 0.2314, 2),
(105, 'ru', 256, 0.3667, 5.5),
(105, 'ru', 257, 0.2314, 6),
(106, 'ru', 2, 0.3667, 3),
(106, 'ru', 103, 0.2314, 5),
(106, 'ru', 111, 0.2314, 6),
(106, 'ru', 171, 0.2314, 8),
(106, 'ru', 258, 0.2314, 1),
(106, 'ru', 259, 0.3667, 8.5),
(106, 'ru', 260, 0.2314, 7),
(107, 'ru', 2, 0.3667, 4),
(107, 'ru', 76, 0.2314, 1),
(107, 'ru', 103, 0.2314, 7),
(107, 'ru', 261, 0.2314, 2),
(107, 'ru', 262, 0.3667, 9.5),
(107, 'ru', 263, 0.2314, 6),
(107, 'ru', 264, 0.2314, 14),
(108, 'ru', 2, 0.3667, 4.5),
(108, 'ru', 103, 0.2314, 8),
(108, 'ru', 157, 0.2314, 9),
(108, 'ru', 265, 0.2314, 1),
(108, 'ru', 266, 0.3667, 9.5),
(108, 'ru', 267, 0.2314, 4),
(108, 'ru', 268, 0.2314, 5),
(108, 'ru', 269, 0.2314, 6),
(108, 'ru', 270, 0.2314, 15),
(109, 'ru', 2, 0.3667, 4),
(109, 'ru', 103, 0.2314, 6),
(109, 'ru', 265, 0.2314, 1),
(109, 'ru', 271, 0.2314, 2),
(109, 'ru', 272, 0.3667, 6.5),
(109, 'ru', 273, 0.2314, 8),
(110, 'ru', 3, 0.2314, 5),
(110, 'ru', 86, 0.2314, 3),
(110, 'ru', 274, 0.2314, 1),
(110, 'ru', 275, 0.2314, 2),
(110, 'ru', 276, 0.3667, 10),
(110, 'ru', 277, 0.2314, 6),
(110, 'ru', 278, 0.2314, 7),
(110, 'ru', 279, 0.2314, 15),
(111, 'ru', 2, 0.2314, 5),
(111, 'ru', 86, 0.2314, 3),
(111, 'ru', 274, 0.2314, 1),
(111, 'ru', 275, 0.2314, 2),
(111, 'ru', 280, 0.3667, 8.5),
(111, 'ru', 281, 0.2314, 12),
(112, 'ru', 2, 0.2314, 5),
(112, 'ru', 87, 0.2314, 3),
(112, 'ru', 103, 0.2314, 6),
(112, 'ru', 264, 0.2314, 13),
(112, 'ru', 274, 0.2314, 1),
(112, 'ru', 275, 0.2314, 2),
(112, 'ru', 282, 0.3667, 9),
(113, 'ru', 88, 0.2314, 2),
(113, 'ru', 283, 0.2314, 1),
(113, 'ru', 284, 0.3667, 10),
(113, 'ru', 285, 0.2314, 4),
(113, 'ru', 286, 0.2314, 11),
(113, 'ru', 287, 0.2314, 12),
(113, 'ru', 288, 0.2314, 15),
(114, 'ru', 2, 0.3667, 4),
(114, 'ru', 103, 0.2314, 6),
(114, 'ru', 274, 0.2314, 1),
(114, 'ru', 281, 0.2314, 13),
(114, 'ru', 289, 0.2314, 2),
(114, 'ru', 290, 0.3667, 13),
(114, 'ru', 291, 0.2314, 20),
(114, 'ru', 292, 0.2314, 21),
(115, 'ru', 2, 0.3667, 5),
(115, 'ru', 103, 0.2314, 7),
(115, 'ru', 293, 0.2314, 1),
(115, 'ru', 294, 0.3667, 10),
(116, 'ru', 3, 0.2314, 3),
(116, 'ru', 113, 0.2314, 18),
(116, 'ru', 160, 0.2314, 24),
(116, 'ru', 250, 0.2314, 25),
(116, 'ru', 295, 0.2314, 1),
(116, 'ru', 296, 0.2314, 2),
(116, 'ru', 297, 0.3667, 15),
(116, 'ru', 298, 0.2314, 5),
(117, 'ru', 89, 0.2314, 2),
(117, 'ru', 90, 0.2314, 3),
(117, 'ru', 299, 0.2314, 1),
(117, 'ru', 300, 0.3667, 8.5),
(117, 'ru', 301, 0.2314, 5),
(117, 'ru', 302, 0.2314, 6),
(117, 'ru', 303, 0.2314, 7),
(117, 'ru', 304, 0.2314, 8),
(117, 'ru', 305, 0.2314, 9),
(117, 'ru', 306, 0.2314, 10),
(117, 'ru', 307, 0.2314, 12),
(118, 'ru', 85, 0.2314, 6),
(118, 'ru', 91, 0.2314, 4),
(118, 'ru', 308, 0.2314, 1),
(118, 'ru', 309, 0.3667, 21.5),
(118, 'ru', 310, 0.2314, 7),
(118, 'ru', 311, 0.2314, 9),
(118, 'ru', 312, 0.2314, 10),
(118, 'ru', 313, 0.2314, 11),
(118, 'ru', 314, 0.2314, 18),
(118, 'ru', 315, 0.2314, 24),
(118, 'ru', 316, 0.2314, 30),
(118, 'ru', 317, 0.2314, 32),
(119, 'ru', 89, 0.2314, 2),
(119, 'ru', 90, 0.2314, 3),
(119, 'ru', 141, 0.2314, 6),
(119, 'ru', 299, 0.2314, 1),
(119, 'ru', 305, 0.2314, 10),
(119, 'ru', 306, 0.2314, 11),
(119, 'ru', 307, 0.2314, 13),
(119, 'ru', 318, 0.3667, 9),
(119, 'ru', 319, 0.2314, 5),
(119, 'ru', 320, 0.2314, 7),
(119, 'ru', 321, 0.2314, 8),
(119, 'ru', 322, 0.2314, 9),
(120, 'ru', 92, 0.2314, 2),
(120, 'ru', 299, 0.2314, 1),
(120, 'ru', 303, 0.2314, 4),
(120, 'ru', 323, 0.3667, 6),
(120, 'ru', 324, 0.2314, 5),
(120, 'ru', 325, 0.2314, 6),
(120, 'ru', 326, 0.2314, 7),
(120, 'ru', 327, 0.2314, 8),
(121, 'ru', 2, 0.2314, 5),
(121, 'ru', 93, 0.2314, 3),
(121, 'ru', 317, 0.2314, 28),
(121, 'ru', 328, 0.2314, 1),
(121, 'ru', 329, 0.2314, 2),
(121, 'ru', 330, 0.3667, 19),
(121, 'ru', 331, 0.2314, 6),
(121, 'ru', 332, 0.3667, 15.5),
(121, 'ru', 333, 0.2314, 9),
(121, 'ru', 334, 0.2314, 17),
(121, 'ru', 335, 0.2314, 18),
(121, 'ru', 336, 0.2314, 19),
(121, 'ru', 337, 0.2314, 20),
(121, 'ru', 338, 0.2314, 21),
(121, 'ru', 339, 0.2314, 22),
(121, 'ru', 340, 0.2314, 24),
(121, 'ru', 341, 0.2314, 25),
(121, 'ru', 342, 0.2314, 26),
(122, 'ru', 91, 0.2314, 4),
(122, 'ru', 308, 0.2314, 1),
(122, 'ru', 313, 0.2314, 10),
(122, 'ru', 314, 0.2314, 17),
(122, 'ru', 315, 0.2314, 23),
(122, 'ru', 316, 0.2314, 29),
(122, 'ru', 343, 0.3667, 17.5),
(122, 'ru', 344, 0.2314, 6),
(122, 'ru', 345, 0.2314, 7),
(122, 'ru', 346, 0.2314, 8),
(122, 'ru', 347, 0.2314, 9),
(123, 'ru', 91, 0.2314, 4),
(123, 'ru', 136, 0.2314, 6),
(123, 'ru', 307, 0.2314, 30),
(123, 'ru', 308, 0.2314, 1),
(123, 'ru', 313, 0.2314, 15),
(123, 'ru', 314, 0.2314, 22),
(123, 'ru', 315, 0.2314, 23),
(123, 'ru', 317, 0.2314, 37),
(123, 'ru', 348, 0.3667, 24),
(123, 'ru', 349, 0.2314, 7),
(123, 'ru', 350, 0.2314, 8),
(123, 'ru', 351, 0.2314, 9),
(124, 'ru', 94, 0.2314, 4),
(124, 'ru', 352, 0.2314, 1),
(124, 'ru', 353, 0.2314, 3),
(124, 'ru', 354, 0.3667, 8),
(124, 'ru', 355, 0.2314, 6),
(124, 'ru', 356, 0.2314, 7),
(124, 'ru', 357, 0.2314, 9),
(124, 'ru', 358, 0.2314, 10),
(125, 'ru', 91, 0.2314, 4),
(125, 'ru', 308, 0.2314, 1),
(125, 'ru', 313, 0.2314, 11),
(125, 'ru', 314, 0.2314, 18),
(125, 'ru', 315, 0.2314, 24),
(125, 'ru', 316, 0.2314, 25),
(125, 'ru', 317, 0.2314, 32),
(125, 'ru', 347, 0.2314, 10),
(125, 'ru', 359, 0.3667, 21.5),
(125, 'ru', 360, 0.2314, 6),
(125, 'ru', 361, 0.2314, 7),
(125, 'ru', 362, 0.2314, 8),
(125, 'ru', 363, 0.2314, 9),
(126, 'ru', 91, 0.2314, 4),
(126, 'ru', 308, 0.2314, 1),
(126, 'ru', 313, 0.2314, 10),
(126, 'ru', 314, 0.2314, 17),
(126, 'ru', 315, 0.2314, 23),
(126, 'ru', 316, 0.2314, 29),
(126, 'ru', 344, 0.2314, 6),
(126, 'ru', 347, 0.2314, 9),
(126, 'ru', 364, 0.3667, 17.5),
(126, 'ru', 365, 0.2314, 7),
(126, 'ru', 366, 0.2314, 8),
(127, 'ru', 95, 0.2314, 3),
(127, 'ru', 96, 0.2314, 4),
(127, 'ru', 352, 0.2314, 1),
(127, 'ru', 367, 0.2314, 2),
(127, 'ru', 368, 0.3667, 7.5),
(127, 'ru', 369, 0.2314, 6),
(127, 'ru', 370, 0.2314, 7),
(127, 'ru', 371, 0.2314, 8),
(127, 'ru', 372, 0.2314, 9),
(128, 'ru', 97, 0.2314, 3),
(128, 'ru', 373, 0.2314, 1),
(128, 'ru', 374, 0.2314, 2),
(128, 'ru', 375, 0.3667, 15),
(128, 'ru', 376, 0.2314, 5),
(128, 'ru', 377, 0.2314, 12),
(128, 'ru', 378, 0.2314, 18),
(128, 'ru', 379, 0.3667, 18),
(128, 'ru', 380, 0.2314, 22),
(128, 'ru', 381, 0.2314, 23),
(128, 'ru', 382, 0.2314, 24),
(128, 'ru', 383, 0.2314, 25),
(129, 'ru', 95, 0.2314, 3),
(129, 'ru', 96, 0.2314, 4),
(129, 'ru', 352, 0.2314, 1),
(129, 'ru', 367, 0.2314, 2),
(129, 'ru', 369, 0.2314, 6),
(129, 'ru', 384, 0.3667, 14.5),
(129, 'ru', 385, 0.2314, 19),
(129, 'ru', 386, 0.2314, 20),
(129, 'ru', 387, 0.2314, 21),
(129, 'ru', 388, 0.2314, 22),
(129, 'ru', 389, 0.2314, 23),
(130, 'ru', 91, 0.2314, 4),
(130, 'ru', 308, 0.2314, 1),
(130, 'ru', 313, 0.2314, 10),
(130, 'ru', 314, 0.2314, 17),
(130, 'ru', 315, 0.2314, 23),
(130, 'ru', 316, 0.2314, 29),
(130, 'ru', 317, 0.2314, 31),
(130, 'ru', 347, 0.2314, 9),
(130, 'ru', 390, 0.3667, 21),
(130, 'ru', 391, 0.2314, 6),
(130, 'ru', 392, 0.2314, 7),
(130, 'ru', 393, 0.2314, 8),
(131, 'ru', 95, 0.2314, 3),
(131, 'ru', 96, 0.2314, 4),
(131, 'ru', 352, 0.2314, 1),
(131, 'ru', 367, 0.2314, 2),
(131, 'ru', 369, 0.2314, 6),
(131, 'ru', 394, 0.3667, 8.5),
(131, 'ru', 395, 0.2314, 7),
(131, 'ru', 396, 0.2314, 8),
(131, 'ru', 397, 0.2314, 9),
(131, 'ru', 398, 0.2314, 10),
(131, 'ru', 399, 0.2314, 11),
(132, 'ru', 95, 0.2314, 3),
(132, 'ru', 96, 0.2314, 4),
(132, 'ru', 352, 0.2314, 1),
(132, 'ru', 367, 0.2314, 2),
(132, 'ru', 369, 0.2314, 6),
(132, 'ru', 400, 0.3667, 7),
(132, 'ru', 401, 0.2314, 7),
(132, 'ru', 402, 0.2314, 8),
(133, 'ru', 91, 0.2314, 4),
(133, 'ru', 308, 0.2314, 1),
(133, 'ru', 311, 0.2314, 8),
(133, 'ru', 313, 0.2314, 10),
(133, 'ru', 314, 0.2314, 17),
(133, 'ru', 316, 0.2314, 29),
(133, 'ru', 317, 0.2314, 31),
(133, 'ru', 347, 0.2314, 9),
(133, 'ru', 403, 0.3667, 21),
(133, 'ru', 404, 0.2314, 6),
(133, 'ru', 405, 0.2314, 7),
(133, 'ru', 406, 0.2314, 23),
(134, 'ru', 98, 0.2314, 4),
(134, 'ru', 308, 0.2314, 1),
(134, 'ru', 313, 0.2314, 10),
(134, 'ru', 314, 0.2314, 17),
(134, 'ru', 315, 0.2314, 23),
(134, 'ru', 316, 0.2314, 29),
(134, 'ru', 347, 0.2314, 9),
(134, 'ru', 407, 0.3667, 17.5),
(134, 'ru', 408, 0.2314, 6),
(134, 'ru', 409, 0.2314, 7),
(134, 'ru', 410, 0.2314, 8),
(135, 'ru', 99, 0.2314, 3),
(135, 'ru', 352, 0.2314, 1),
(135, 'ru', 411, 0.2314, 2),
(135, 'ru', 412, 0.3667, 22),
(135, 'ru', 413, 0.2314, 6),
(135, 'ru', 414, 0.2314, 12),
(135, 'ru', 415, 0.2314, 18),
(135, 'ru', 416, 0.2314, 19),
(135, 'ru', 417, 0.2314, 25),
(135, 'ru', 418, 0.2314, 32),
(135, 'ru', 419, 0.2314, 33),
(135, 'ru', 420, 0.2314, 39),
(136, 'ru', 2, 0.2314, 6),
(136, 'ru', 91, 0.2314, 4),
(136, 'ru', 103, 0.2314, 7),
(136, 'ru', 307, 0.2314, 31),
(136, 'ru', 308, 0.2314, 1),
(136, 'ru', 313, 0.2314, 11),
(136, 'ru', 314, 0.2314, 18),
(136, 'ru', 315, 0.2314, 24),
(136, 'ru', 317, 0.2314, 38),
(136, 'ru', 332, 0.2314, 9),
(136, 'ru', 347, 0.2314, 10),
(136, 'ru', 421, 0.3667, 24.5),
(136, 'ru', 422, 0.2314, 8),
(137, 'ru', 100, 0.2314, 2),
(137, 'ru', 136, 0.2314, 5),
(137, 'ru', 315, 0.2314, 14),
(137, 'ru', 316, 0.2314, 20),
(137, 'ru', 346, 0.2314, 7),
(137, 'ru', 353, 0.2314, 1),
(137, 'ru', 423, 0.3667, 15),
(137, 'ru', 424, 0.2314, 4),
(137, 'ru', 425, 0.2314, 6),
(137, 'ru', 426, 0.2314, 8),
(137, 'ru', 427, 0.2314, 21),
(138, 'ru', 91, 0.2314, 4),
(138, 'ru', 308, 0.2314, 1),
(138, 'ru', 313, 0.2314, 15),
(138, 'ru', 314, 0.2314, 22),
(138, 'ru', 317, 0.2314, 29),
(138, 'ru', 346, 0.2314, 13),
(138, 'ru', 347, 0.2314, 14),
(138, 'ru', 428, 0.3667, 20),
(138, 'ru', 429, 0.2314, 6),
(138, 'ru', 430, 0.2314, 7),
(138, 'ru', 431, 0.2314, 8),
(138, 'ru', 432, 0.2314, 9),
(138, 'ru', 433, 0.2314, 10),
(138, 'ru', 434, 0.2314, 11),
(138, 'ru', 435, 0.2314, 12),
(139, 'ru', 436, 0.2314, 1),
(140, 'ru', 436, 0.2314, 4),
(140, 'ru', 437, 0.2314, 1),
(140, 'ru', 438, 0.2314, 2),
(140, 'ru', 439, 0.2314, 3),
(140, 'ru', 440, 0.3667, 13),
(140, 'ru', 441, 0.2314, 6),
(140, 'ru', 442, 0.2314, 12),
(140, 'ru', 443, 0.2314, 13),
(140, 'ru', 444, 0.2314, 19),
(140, 'ru', 445, 0.2314, 20),
(141, 'ru', 446, 0.2314, 1),
(142, 'ru', 313, 0.2314, 7),
(142, 'ru', 446, 0.2314, 2),
(142, 'ru', 447, 0.2314, 1),
(142, 'ru', 448, 0.3667, 6),
(142, 'ru', 449, 0.2314, 4),
(142, 'ru', 450, 0.2314, 6),
(142, 'ru', 451, 0.2314, 8),
(143, 'ru', 442, 0.2314, 1),
(144, 'ru', 193, 0.2314, 17),
(144, 'ru', 442, 0.2314, 3),
(144, 'ru', 452, 0.2314, 1),
(144, 'ru', 453, 0.2314, 2),
(144, 'ru', 454, 0.3667, 11),
(144, 'ru', 455, 0.2314, 7),
(144, 'ru', 456, 0.2314, 9),
(144, 'ru', 457, 0.2314, 10),
(144, 'ru', 458, 0.2314, 16),
(145, 'ru', 91, 0.2314, 4),
(145, 'ru', 136, 0.2314, 6),
(145, 'ru', 308, 0.2314, 1),
(145, 'ru', 313, 0.2314, 11),
(145, 'ru', 314, 0.2314, 18),
(145, 'ru', 315, 0.2314, 24),
(145, 'ru', 316, 0.2314, 30),
(145, 'ru', 317, 0.2314, 32),
(145, 'ru', 346, 0.2314, 8),
(145, 'ru', 347, 0.2314, 10),
(145, 'ru', 425, 0.2314, 7),
(145, 'ru', 459, 0.3667, 21.5),
(145, 'ru', 460, 0.2314, 9),
(146, 'ru', 85, 0.2314, 6),
(146, 'ru', 91, 0.2314, 4),
(146, 'ru', 308, 0.2314, 1),
(146, 'ru', 313, 0.2314, 11),
(146, 'ru', 314, 0.2314, 18),
(146, 'ru', 315, 0.2314, 24),
(146, 'ru', 316, 0.2314, 30),
(146, 'ru', 317, 0.2314, 32),
(146, 'ru', 347, 0.2314, 10),
(146, 'ru', 461, 0.3667, 21.5),
(146, 'ru', 462, 0.2314, 7),
(146, 'ru', 463, 0.2314, 9),
(147, 'ru', 83, 0.2314, 6),
(147, 'ru', 91, 0.2314, 4),
(147, 'ru', 308, 0.2314, 1),
(147, 'ru', 313, 0.2314, 10),
(147, 'ru', 314, 0.2314, 17),
(147, 'ru', 315, 0.2314, 23),
(147, 'ru', 316, 0.2314, 29),
(147, 'ru', 347, 0.2314, 9),
(147, 'ru', 464, 0.3667, 17.5),
(147, 'ru', 465, 0.2314, 7),
(147, 'ru', 466, 0.2314, 8),
(148, 'ru', 467, 0.2314, 1),
(149, 'ru', 468, 0.2314, 1),
(149, 'ru', 469, 0.2314, 2),
(149, 'ru', 470, 0.2314, 3),
(149, 'ru', 471, 0.2314, 5),
(149, 'ru', 472, 0.2314, 6),
(149, 'ru', 473, 0.2314, 7),
(149, 'ru', 474, 0.2314, 9),
(149, 'ru', 475, 0.2314, 10),
(149, 'ru', 476, 0.2314, 11),
(149, 'ru', 477, 0.2314, 12),
(149, 'ru', 478, 0.2314, 18),
(149, 'ru', 479, 0.2314, 19),
(149, 'ru', 480, 0.2314, 26),
(149, 'ru', 481, 0.2314, 32),
(150, 'ru', 7, 0.1552, 2),
(150, 'ru', 436, 0.1552, 45),
(150, 'ru', 467, 0.1552, 3),
(150, 'ru', 482, 0.246, 2.5),
(150, 'ru', 483, 0.1552, 5),
(150, 'ru', 484, 0.3104, 46.3333),
(150, 'ru', 485, 0.3104, 47.3333),
(150, 'ru', 486, 0.3104, 48.3333),
(150, 'ru', 487, 0.3104, 49.3333),
(150, 'ru', 488, 0.3104, 50.3333),
(150, 'ru', 489, 0.3104, 51.3333),
(150, 'ru', 490, 0.3104, 52.3333),
(150, 'ru', 491, 0.3104, 53.3333),
(150, 'ru', 492, 0.3104, 54.3333),
(150, 'ru', 493, 0.3104, 55.3333),
(150, 'ru', 494, 0.3104, 56.3333),
(150, 'ru', 495, 0.3104, 57.3333),
(150, 'ru', 496, 0.3104, 58.3333),
(150, 'ru', 497, 0.3104, 59.3333),
(150, 'ru', 498, 0.3104, 65.3333),
(150, 'ru', 499, 0.3104, 66.3333),
(150, 'ru', 500, 0.3104, 67.3333),
(150, 'ru', 501, 0.3104, 69.3333),
(150, 'ru', 502, 0.3104, 70.3333),
(150, 'ru', 503, 0.3104, 71.3333),
(150, 'ru', 504, 0.3104, 72.3333),
(150, 'ru', 505, 0.3104, 73.3333),
(150, 'ru', 506, 0.3104, 74.3333),
(150, 'ru', 507, 0.3104, 76.3333),
(150, 'ru', 508, 0.3104, 77.3333),
(150, 'ru', 509, 0.3104, 78.3333),
(150, 'ru', 510, 0.1552, 44),
(150, 'ru', 511, 0.1552, 84),
(150, 'ru', 512, 0.1552, 86),
(151, 'ru', 269, 0.1424, 22),
(151, 'ru', 467, 0.1424, 44),
(151, 'ru', 480, 0.1424, 1),
(151, 'ru', 484, 0.2848, 106),
(151, 'ru', 485, 0.2848, 107),
(151, 'ru', 486, 0.2848, 108),
(151, 'ru', 487, 0.2848, 109),
(151, 'ru', 488, 0.2848, 110),
(151, 'ru', 489, 0.2848, 111),
(151, 'ru', 490, 0.2848, 112),
(151, 'ru', 491, 0.2848, 113),
(151, 'ru', 492, 0.2848, 114),
(151, 'ru', 493, 0.2848, 115),
(151, 'ru', 494, 0.2848, 116),
(151, 'ru', 495, 0.2848, 117),
(151, 'ru', 496, 0.2848, 118),
(151, 'ru', 497, 0.2848, 119),
(151, 'ru', 498, 0.2848, 125),
(151, 'ru', 499, 0.2848, 126),
(151, 'ru', 500, 0.2848, 127),
(151, 'ru', 501, 0.2848, 129),
(151, 'ru', 502, 0.2848, 130),
(151, 'ru', 503, 0.2848, 131),
(151, 'ru', 504, 0.2848, 132),
(151, 'ru', 505, 0.2848, 133),
(151, 'ru', 506, 0.2848, 134),
(151, 'ru', 507, 0.2848, 136),
(151, 'ru', 508, 0.2848, 137),
(151, 'ru', 509, 0.3306, 158.5),
(151, 'ru', 513, 0.3998, 19.5),
(151, 'ru', 514, 0.3998, 20.5),
(151, 'ru', 515, 0.3998, 22.5),
(151, 'ru', 516, 0.3998, 23.5),
(151, 'ru', 517, 0.3998, 24.5),
(151, 'ru', 518, 0.1424, 8),
(151, 'ru', 519, 0.1424, 15),
(151, 'ru', 520, 0.1424, 29),
(151, 'ru', 521, 0.1424, 36),
(151, 'ru', 522, 0.1424, 43),
(151, 'ru', 523, 0.2848, 103),
(151, 'ru', 524, 0.2848, 105),
(151, 'ru', 525, 0.2848, 144),
(151, 'ru', 526, 0.2848, 145),
(151, 'ru', 527, 0.1424, 219),
(152, 'ru', 7, 0.1934, 4),
(152, 'ru', 470, 0.1934, 7),
(152, 'ru', 484, 0.1934, 17),
(152, 'ru', 485, 0.1934, 18),
(152, 'ru', 486, 0.1934, 19),
(152, 'ru', 489, 0.1934, 21),
(152, 'ru', 490, 0.1934, 22),
(152, 'ru', 491, 0.1934, 23),
(152, 'ru', 492, 0.1934, 24),
(152, 'ru', 493, 0.1934, 25),
(152, 'ru', 494, 0.1934, 26),
(152, 'ru', 495, 0.1934, 27),
(152, 'ru', 496, 0.1934, 28),
(152, 'ru', 497, 0.1934, 29),
(152, 'ru', 498, 0.1934, 35),
(152, 'ru', 499, 0.1934, 36),
(152, 'ru', 500, 0.1934, 37),
(152, 'ru', 501, 0.1934, 39),
(152, 'ru', 502, 0.1934, 40),
(152, 'ru', 503, 0.1934, 41),
(152, 'ru', 504, 0.1934, 42),
(152, 'ru', 505, 0.1934, 43),
(152, 'ru', 506, 0.1934, 44),
(152, 'ru', 507, 0.1934, 46),
(152, 'ru', 508, 0.1934, 47),
(152, 'ru', 509, 0.1934, 48),
(152, 'ru', 523, 0.1934, 14),
(152, 'ru', 524, 0.1934, 16),
(152, 'ru', 528, 0.3869, 4.6667),
(152, 'ru', 529, 0.1934, 3),
(152, 'ru', 530, 0.1934, 6),
(152, 'ru', 531, 0.1934, 10),
(152, 'ru', 532, 0.1934, 11),
(152, 'ru', 533, 0.1934, 20);

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_text`
--

CREATE TABLE `b_search_content_text` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SEARCH_CONTENT_MD5` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `SEARCHABLE_CONTENT` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_search_content_text`
--

INSERT INTO `b_search_content_text` (`SEARCH_CONTENT_ID`, `SEARCH_CONTENT_MD5`, `SEARCHABLE_CONTENT`) VALUES
(5, 'ef65c032f6f6c7e96b2d828b2b906a9e', 'КАТЕГОРИИ\r\nГЛАВНАЯ\rКАТАЛОГ\rКАТЕГОРИЯ\rАКСЕССУАРЫ\r\n'),
(6, '0621b5ec0c7674f0dca4abd8b94b0df4', 'ТОВАР\r\nГЛАВНАЯ\rКАТАЛОГ\rКАТЕГОРИЯ\rПОХОЖИЕ ТОВАРЫ\rТОВАР\nТОВАР\nТОВАР\nТОВАР\nТОВАР\r\n'),
(7, '93d555b9e1e7340b110e0acfc5b0845a', 'КАТЕГОРИИ\r\nГЛАВНАЯ\rКАТАЛОГ\rКАТЕГОРИЯ\rАКСЕССУАРЫ\rНАИМЕНОВАНИЕ ПОДКАТЕГОРИИ\rНАИМЕНОВАНИЕ ПОДКАТЕГОРИИ\rНАИМЕНОВАНИЕ ПОДКАТЕГОРИИ\rНАИМЕНОВАНИЕ ПОДКАТЕГОРИИ\rНАИМЕНОВАНИЕ ПОДКАТЕГОРИИ\rНАИМЕНОВАНИЕ ПОДКАТЕГОРИИ\rНАИМЕНОВАНИЕ ПОДКАТЕГОРИИ\rНАИМЕНОВАНИЕ ПОДКАТЕГОРИИ\rНАИМЕНОВАНИЕ ПОДКАТЕГОРИИ\r\n'),
(24, '89f9158562a055909555869de08608a8', 'GATES\r\n\r\n'),
(26, '5eb1df1397fed8f5255c73287578daee', 'MMC\r\n\r\n'),
(27, '33c7fbdffde16101af868dfe37b6cb36', 'TOYOTA\r\n\r\n'),
(28, 'f7feb901ca493b1854383e2c72879d4f', 'VERNET\r\n\r\n'),
(29, '31de77a367b6cf9c33ac60c9ea9777db', 'DEPO\r\n\r\n'),
(30, '992bd729bc6720c73efd7307df69202b', 'NISSAN\r\n\r\n'),
(31, '03ceab2418a7e5f9c472b9a8bcc24a1f', 'OCAP\r\n\r\n'),
(32, '10ad817519b4e6e31323fda727f0dfad', 'OPEL\r\n\r\n'),
(33, '79131188fcf2d0c96bae2eebac8ab772', 'FRAM\r\n\r\n'),
(34, '16190a70a13ebd79a897a302f728cb3a', 'BOSCH\r\n\r\n'),
(35, '0b3fd2ebc73d5b9694e41008407ddebe', 'FEBI\r\n\r\n'),
(36, 'd69d03f11ff44c5516a2420b1f0d0d7b', 'MTF LIGHT\r\n\r\n'),
(37, '32bd6fc2652abc9562860d9717f45c55', 'NORPLAST\r\n\r\n'),
(38, '5cec3020426aba788e96c8918b5ea5a5', 'SVS\r\n\r\n'),
(39, 'bdc093a8647e399daf24af83587c020c', 'ALFECO\r\n\r\n'),
(40, 'b4db07d0a0fa2f6cc59f40ed3dab24e4', 'SLIM\r\n\r\n'),
(41, 'b8dec31e543bf8f2eaf8c9439c95c4c8', 'AIR COUTURE\r\n\r\n'),
(42, '48966b16ac6d88d46276900c13b45939', 'AIRLINE\r\n\r\n'),
(43, '95fe3571d4f6d659c0ec0846148fe31d', 'AILERON\r\n\r\n'),
(44, '0fe6c56a4b402980a8201565003db209', 'CARMATE\r\n\r\n'),
(45, '94ab8f40446dc5f4b21fb34fe6f2a1ab', 'SIM\r\n\r\n'),
(46, '886bf76e571ae0329c3dd0921308e2fc', 'РЕМЕНЬ РУЧЕЙКОВЫЙ GATES 4PK948 MMC PAJERO 3.0I\r\n4PK948\r\n'),
(47, 'c7e0411bc3e02d8dc110f8ed2c8b0052', 'РЕМЕНЬ РУЧЕЙКОВЫЙ GATES 4PK993 MMC PAJERO 3.5I\r\n4PK993\r\n'),
(48, '35dd9c167ac43f72738a0e919ab5c9f9', 'РЕМЕНЬ РУЧЕЙКОВЫЙ GATES 4PK1063 MMC PAJERO 3.5I (4PK1063)\r\n4PK1063\r\n'),
(49, '0413b9b5e6bb36ae1166be54df3cc37e', 'РЕМЕНЬ ГЕНЕРАТОРА GATES 6462MC MMC PAJERO 3.0I\r\n6462MC\r\n'),
(50, 'eb201b526b880d456f34595cc226a362', 'РЕМЕНЬ РУЧЕЙКОВЫЙ GATES 5PK1123 MMC PAJERO 3.0I 91>\r\n5PK1123\r\n'),
(51, 'dc2014f73c0848c26298c5fbb90d9aa6', 'РЕМЕНЬ ГЕНЕРАТОРА GATES 6220MC TOYOTA L.CR.FJ80 4.2TD\r\n6220MC\r\n'),
(52, '2dc1f5a06b897f4a8a5b2cecd3a67a7f', 'РЕМЕНЬ ГРМ GATES 5228XS MMC PAJERO 3.0I -94\r\n5228XS\r\n'),
(53, '50bc611cd20c386dc363f51c098a56f1', 'РЕМЕНЬ ГРМ MMC MD111427 MMC PAJERO 3.0 -94 SOHC\r\nMD111427\r\n'),
(54, '2958742df8fc97507b2c2fefa0b904fe', 'РЕМЕНЬ ГРМ MMC MD307487 MMC PAJERO 3.0 94- SOHC\r\nMD307487\r\n'),
(55, '3e2e1c223ca5e53f07cb05995a0ffc57', 'РЕМЕНЬ ГРМ TOYOTA 1356819065 (94*25,4) L.CR.FJ80/100 HZ HDT\r\n1356819065\r\n'),
(56, 'd0ee1e3a51d55267e57bab8b7433d73c', 'РЕМЕНЬ ГЕНЕРАТОРА GATES 6467MC MMC PAJERO 3.0I 3.5I\r\n6467MC\r\n'),
(57, '3558f67721fb66da4dcba7a5f5d2a461', 'РЕМЕНЬ ГЕНЕРАТОРА GATES 6478MC TOYOTA 4-RANNER 3.0 2.4TD\r\n6478MC\r\n'),
(58, 'c29c511210a06412370d40c116923c53', 'РЕМЕНЬ ГЕНЕРАТОРА GATES 6481MC TOYOTA L.CR.FJ80 4.2TD\r\n6481MC\r\n'),
(59, '835d0b0104d2702f9af6147347d187cb', 'ТЕРМОСТАТ VERNET TH627387J VW PASSAT 1.6/1.9TD/2.3 86-00/AUDI 80/A4/A6 1.9TD 96-\r\nTH627387J\r\n'),
(60, '848ca9a70ef5c5fd6f952dcb220f706d', 'ПОВОРОТНИК DEPO 2131515RA ISUZU TROOPER 92> R\r\n2131515RA\r\n'),
(61, 'e22533178257d68cb32b93add2f6458c', 'ФОНАРЬ MMC MR124963 MMC PAJERO 93> L\r\nMR124963\r\n'),
(62, '5724ef822b093d4ba2fc600b4ccde344', 'АМОРТИЗАТОР TOYOTA 4851139766 4 RUN.-95 ПЕР. ГАЗ.\r\n4851139766\r\n'),
(63, 'cb19734a838bd74c300fd175dfe7ec80', 'АМОРТИЗАТОР TOYOTA 4851169435 TOYOTA L.CR.-80 ПЕР.\r\n4851169435\r\n'),
(64, '17228c57bf87a9cd610cb85a58bec273', 'ВТУЛКА РЕССОРЫ MMC MB111203 PAJERO 84>\r\nMB111203\r\n'),
(65, 'b9dc9a7f7e0a8e4d90b65b2cdc86f110', 'ВТУЛКА РЕССОРЫ MMC MB584530 PAJERO 91>\r\nMB584530\r\n'),
(66, 'ca28d4339beafc5c03062fbf6becf5f8', 'ВТУЛКА РЕССОРЫ MMC MB584531 PAJERO 91>\r\nMB584531\r\n'),
(67, 'ef02c1039ed630be13aca06cd6a7b33c', 'ТЯГА СТАБИЛ. MMC MB598098 M.PAJERO 5ДВ ЗАДН\r\nMB598098\r\n'),
(68, '475a0b039a4eff74ec91de3667e094e3', 'ВТУЛКА СТАБИЛ. NISSAN 546137F001 TERRANO-II ЗАДН.\r\n546137F001\r\n'),
(69, '747f8c37d8cd29de820fe3110b3c940c', 'ВТУЛКА СТАБИЛ. NISSAN 54613VB010 PATROL Y61 ЗАДН. >2000Г 18ММ\r\n54613VB010\r\n'),
(70, 'b1ec1978fed5f67bd930cf1ed2e7f096', 'ВТУЛКА СТАБИЛ. TOYOTA 4881520200 D25 4 RUNNNER 92-95 ЗАДН.\r\n4881520200\r\n'),
(71, 'a91c3875500add6c7b01eab600cd9ff5', 'ВТУЛКА СТАБИЛ. TOYOTA 4881526020 D25 LN.CRUISER FJ80 08/92- ЗАДН.\r\n4881526020\r\n'),
(72, '7aacafea3397797c9c83f8bbf2705a46', 'ВТУЛКА СТАБИЛ. TOYOTA 4881530070 D16 4-RUN ЗАДН.\r\n4881530070\r\n'),
(73, 'e3acf8ebacec3b3901dfbae557c28405', 'ВТУЛКА СТАБИЛ. КОНЦЕВАЯ MMC MB831039 PAJERO 91> (2ШТ+2ШАЙБЫ+ГАЙКА)\r\nMB831039\r\n'),
(74, 'fb9b1c591a56fa9ba94a5136445215cb', 'ВТУЛКА СТАБИЛ. КОНЦЕВАЯ NISSAN 56112V0100 PATROL,TERRANO\r\n56112V0100\r\n'),
(75, 'bf03cb6f9d58a0366293c66ef75b9afa', 'ВТУЛКА СТАБИЛ. КОНЦЕВАЯ TOYOTA 4881730010 LN.CRUISER FJ80\r\n4881730010\r\n'),
(76, 'cabb0d7c7670d3e9c29fe3541bd6a10b', 'ВТУЛКА СТАБИЛ. КОНЦЕВАЯ TOYOTA 4881730020 4 RUN 93-\r\n4881730020\r\n'),
(77, '19ffa3e64585afc6ebf14de1da2d69fc', 'ВТУЛКА СТАБИЛ. КОНЦЕВАЯ TOYOTA 9094801002 4 RUNNER\r\n9094801002\r\n'),
(78, '75cf174e446e61c57caa9765e1d7ae55', 'ВТУЛКА СТАБИЛ. MMC MR150092 PAJERO 91> ПЕР.\r\nMR150092\r\n'),
(79, 'b84ec91aab1b153ad6e7f92873c75113', 'ВТУЛКА СТАБИЛ. MMC MR150093 PAJERO 91> ПЕР.\r\nMR150093\r\n'),
(80, '56d9a465573c35de7b8eb5b3801c1f21', 'ВТУЛКА СТАБИЛ. MMC MR150095 PAJERO 5 ДВ 94> ПЕР.\r\nMR150095\r\n'),
(81, 'de88be69b1434a472654a3dda6c640c2', 'ВТУЛКА СТАБИЛ. NISSAN 5461342G00 TERRANO 2.4I ПЕР.\r\n5461342G00\r\n'),
(82, 'f234cc78883eb0fe021031ed17a42e2f', 'ВТУЛКА СТАБИЛ. NISSAN 5461388G00 TERRANO 2.4I/3.0I/2.7TD 89> ПЕР.\r\n5461388G00\r\n'),
(83, '5ac1fb9497e6940e6cf41d1132314cf3', 'ВТУЛКА СТАБИЛ. NISSAN 546139C105 NISSAN TERRANO II ПЕР.\r\n546139C105\r\n'),
(84, 'a22b746194979facab3dc976c76a5282', 'ВТУЛКА СТАБИЛ. NISSAN 54613VB002 PATROL Y61 ПЕР.\r\n54613VB002\r\n'),
(85, '90ef721a1791f4dec79b348b5f372d58', 'ВТУЛКА СТАБИЛ. TOYOTA 4881526250 D23 LN.CRUISER 100 ЗАД.\r\n4881526250\r\n'),
(86, '19d86dc470de6b666b26ce29ba98b52c', 'ВТУЛКА СТАБИЛ. TOYOTA 4881528080 D24 LN.CRUISER FJ80 ПЕР.\r\n4881528080\r\n'),
(87, '5520fd5917134f6a6af45dc7655b4262', 'ВТУЛКА СТАБИЛ. TOYOTA 4881530040 D20 CARINA E ПЕР.\r\n4881530040\r\n'),
(88, '8db38bdf87014e9b40b73c0329b5297a', 'ВТУЛКА СТАБИЛ. TOYOTA 4881535070 D27 4 RUNNER 92-95 ПЕР.\r\n4881535070\r\n'),
(89, '8b4a75163ed00a3dbfdcd50ce278483d', 'ВТУЛКА СТАБИЛ. TOYOTA 4881560040 D26 LN.CR. FJ80 ПЕР.\r\n4881560040\r\n'),
(90, '5e3a5b93867f29eb87669cfd7d916e7b', 'ВТУЛКА СТАБИЛ. TOYOTA 4881560050 D24 LN.CR. FJ80 ПЕР.\r\n4881560050\r\n'),
(91, '3f832db7989126d95cced0de1be38646', 'ВТУЛКА СТАБИЛ. TOYOTA 4881560070 D29 LN.CR. FJ80 ПЕР.\r\n4881560070\r\n'),
(92, 'b4358f718ee9fb876c51ab38b7409c0c', 'ВТУЛКА СТАБИЛ. TOYOTA 4881560111 D27 LN.CR. 100 ПЕР.\r\n4881560111\r\n'),
(93, 'c47342c2880e62cc89ffd21073a87b0e', 'ТЯГА СТАБИЛ. MMC MR267876 PAJERO 6/93 ПЕР.L\r\nMR267876\r\n'),
(94, '0ced6fd67be721346a6537d2df173e1c', 'ТЯГА СТАБИЛ. MMC MR267877 PAJERO 6/93 ПЕР.R\r\nMR267877\r\n'),
(95, 'eff4467630a0abe08fdd9f87c2cab9f2', 'ОПОРА ШАРОВАЯ MMC MB860829 MMC PAJERO 91> ВЕРХ. L\r\nMB860829\r\n'),
(96, 'ae6c98164fafbc5985ba3ea805c0250f', 'ОПОРА ШАРОВАЯ MMC MB860830 MMC PAJERO 91> ВЕРХ. R\r\nMB860830\r\n'),
(97, '8a6fe4a24303360cb01b2c30d03f0e55', 'ОПОРА ШАРОВАЯ MMC MR296269 MMC PAJERO 91> НИЖ. L\r\nMR296269\r\n'),
(98, '14078801acc614acd7e9876485a49038', 'ОПОРА ШАРОВАЯ MMC MR296270 MMC PAJERO 91> НИЖ. R\r\nMR296270\r\n'),
(99, 'b662ab0796d6877043f216121f477014', 'С/БЛОК MMC MB109684 M.PAJERO 91> ПЕР.НИЖ.РЫЧ.\r\nMB109684\r\n'),
(100, '2e9449e8926b2710d41890ed6ef78e53', 'С/БЛОК MMC MB631492 M.PAJERO 91-6/93 ЗАДН.РЫЧ.\r\nMB631492\r\n'),
(101, '13308eb63eb0333abcc377bb66ef41c2', 'С/БЛОК MMC MR112891 M.PAJERO 6/93> ЗАДН.РЫЧ.\r\nMR112891\r\n'),
(102, 'cefd567a0df70e8a987b973706e5d884', 'НАКОНЕЧНИК РУЛЕВОЙ OCAP 0193759 TOYOTA 4-RUNNER ВНЕШНИЙ.\r\n0193759\r\n'),
(103, 'b8ff395ffcbb82a9743f0723f52c53eb', 'НАКОНЕЧНИК РУЛЕВОЙ TOYOTA 4504669135 L.CR.FJ80 R\r\n4504669135\r\n'),
(104, 'afd05629672bf42aef1133ff9c088748', 'НАКОНЕЧНИК РУЛЕВОЙ TOYOTA 4504769085 L.CR.FJ80 L\r\n4504769085\r\n'),
(105, 'dfae9cd8a3657d156db259f4b9084c3e', 'ПОДУШКА ГЛУШИТЕЛЯ OPEL 0856024 OPEL DIESEL\r\n0856024\r\n'),
(106, '590cfe647cb2a2d5464af1d80c8bb6f7', 'РЕМК-Т MMC MB858466 MMC PAJERO 91> СУППОРТА ЗАДН.\r\nMB858466\r\n'),
(107, '8163e9743f64560cf6c9ea1b59a3045a', 'КОРЗИНА СЦЕПЛЕНИЯ MMC MR317682 MMC  (D250) PAJERO 2.8TD\r\nMR317682\r\n'),
(108, 'd81789277a99e49daefb07225c39095b', 'САЛЬНИК MMC MB160578 42*65*12 MMC PAJERO ПЕР.МОСТА\r\nMB160578\r\n'),
(109, 'e946a8b165ddbc1974229e1f19ac318b', 'САЛЬНИК РАЗДАТКИ MMC MB919210 MMC PAJERO НА КАРДАН\r\nMB919210\r\n'),
(110, 'cdf7ec88eeac09cc6daffeed52fac0c9', 'ФИЛЬТР МАСЛЯНЫЙ FRAM PH3614 TOYOTA, CHRYSLER VOYAGER 2.4 ВОЛГА\r\nPH3614\r\n'),
(111, '2134748623b9b7f24f83414f4a3d4b25', 'ФИЛЬТР МАСЛЯНЫЙ FRAM PH6355 MMC 2.5TD\r\nPH6355\r\n'),
(112, '0a08857696130d825c8dc562d44e0686', 'ФИЛЬТР МАСЛЯНЫЙ BOSCH 0986452063 MMC PAJERO 2.8TD\r\n0986452063\r\n'),
(113, 'f9988ffff32b794bd498206eb09dd761', 'АНТИФРИЗ FEBI 01089 СИНИЙ 1.5L КОНЦЕНТРАТ 1:1 -40°C\r\n01089\r\n'),
(114, '41795c8039c09b734fa8f245d2b7fd54', 'ФИЛЬТР ТОПЛИВНЫЙ MMC MB220900 MMC PAJERO 2.5TD 2.8D TD\r\nMB220900\r\n'),
(115, 'ae6d645134ebf16e8329920a4685c22c', 'ПРОВОДА В/В MMC MD311208 MMC PAJERO 3.5\r\nMD311208\r\n'),
(116, '9f2827e84bbcb1047beab1fa5a18d490', 'СВЕЧА ЗАЖИГАНИЯ TOYOTA 9091901176 K16RU T.L.CR.-80 4-RUNNER\r\n9091901176\r\n'),
(117, 'b1925d80ba68561c8eeeff9fe21b5a15', 'ЛАМПА MTF LIGHT HVN1203 VANADIUM БЕЛО-ГОЛУБОЙ 5000K 55W 12V КОМПЛЕКТ 2 ШТ\r\nHVN1203\r\n'),
(118, '4580486ed27c368864adc047c823c099', 'КОВРИКИ А/М NORPLAST NPLPO6312 OPEL CORSA D 06--> ПОЛИУР-Н ЧЕРН. С БОРТ. КОМПЛ. 4ШТ С КРЕПЛ.\r\nNPLPO6312\r\n'),
(119, 'c5c548d7c0bd09ef5a2f7d6ff0b876c2', 'ЛАМПА MTF LIGHT H8A1211 ARGENTUM +80% БОЛЬШЕ СВЕТА 4000K55W 12V КОМПЛЕКТ 2 ШТ\r\nH8A1211\r\n'),
(120, 'af1514ccb29f1802b112ff868a01ac68', 'ЛАМПА SVS 0210043000 5000K CLASSIC XENON 35W D4S\r\n0210043000\r\n'),
(121, '00972b84904ff16e66ffb3628947fd18', 'ЗАЩИТА ДВИГАТЕЛЯ ALFECO 1402 MMC LANCER X 07-->; ASX 1.8 10---> OUTLANDER XL 06--12  /DELICA D5 07--> +  КПП СТАЛЬ 2ММ С КРЕПЛ.\r\n1402\r\n'),
(122, '6363656a763c091c9b29879af493d38e', 'КОВРИКИ А/М NORPLAST NPLPO6438 PEUGEOT 308 08-->  ПОЛИУРЕТАН ЧЕРН. С БОРТ. КОМПЛ. 4ШТ\r\nNPLPO6438\r\n'),
(123, 'e26b89535d1c1aafa06121a5e6d80f47', 'КОВРИКИ А/М NORPLAST NPLPO9523 VW JETTA 05--10 ПОЛИУР. ЧЕРН. С БОРТ КОМПЛ. 4 ШТ. С КРЕПЛ.\r\nNPLPO9523\r\n'),
(124, '7ea5f6d72ea1fb53e13ade08f40e5a8e', 'ОСВЕЖИТЕЛЬ НА ДЕФЛЕКТОР SLIM SLMV56 ЗЕЛЕНОЕ ЯБЛОКО 8 МЛ  ЖИДКИЙ\r\nSLMV56\r\n'),
(125, '9fa97ad06bc81f6b115d390a7ab0e177', 'КОВРИКИ А/М NORPLAST NPLPO5621 MB MERCEDES-BENZ W210   95-02 ПОЛИУРЕТАН ЧЕРН. С БОРТ. КОМПЛ 4ШТ. С КРЕПЛ.\r\nNPLPO5621\r\n'),
(126, 'edc462e479560f64423abb5cab4aa932', 'КОВРИКИ А/М NORPLAST NPLPO6426 PEUGEOT 206 98--09 ПОЛИУРЕТАН ЧЕРН.С БОРТ. КОМПЛ. 4ШТ\r\nNPLPO6426\r\n'),
(127, 'c8ccaa25e0e5282e44ff32c26eb91e10', 'ОСВЕЖИТЕЛЬ ПОДВЕСНОЙ AIR COUTURE AIR5 АРОМАТ FAHRENHEIT CRISTIAN DIOR\r\nAIR5\r\n'),
(128, '226cc9a538ff20ef440a88f112af55cc', 'УСТРОЙСТВО ЗАРЯДНОЕ AIRLINE ACHM01 УНИВ. ДЛЯ МОБ. ТЕЛЕФОНОВ 8 В 1,  12В/24В, ШНУР -РУЛЕТКА\r\nACHM01\r\n'),
(129, 'b69f1fa42bcbea23c80634703d6fae8d', 'ОСВЕЖИТЕЛЬ ПОДВЕСНОЙ AIR COUTURE AIR11 АРОМАТ S.T.DUPONT ESSENCE PURE POUR HOMME\r\nAIR11\r\n'),
(130, '52d570fce22ac6224a9e4b7aaf0ea2a7', 'КОВРИКИ А/М NORPLAST NPLPO8548 SUZUKI SWIFT 10--> ПОЛИУРЕТАН ЧЕРН. С БОРТ. КОМПЛ. 4ШТ С КРЕПЛ.\r\nNPLPO8548\r\n'),
(131, 'cbfc63b456c41d55193a17fe3fc18933', 'ОСВЕЖИТЕЛЬ ПОДВЕСНОЙ AIR COUTURE AIR3 АРОМАТ ACQUA DI GIO GIORGIO ARMANI\r\nAIR3\r\n'),
(132, '9a4d20c8c8cfb667d91f55deaf61d6e6', 'ОСВЕЖИТЕЛЬ ПОДВЕСНОЙ AIR COUTURE AIR15 АРОМАТ CHROME AZZARO\r\nAIR15\r\n'),
(133, '5772b013ebed1796aacd0fc7a142d582', 'КОВРИКИ А/М NORPLAST NPLPO1209 CHEVROLET EPICA 06-->ПОЛИУРЕТАН ЧЕРН. С БОРТ. КРМПЛ. 4ШТ С КРЕПЛ.\r\nNPLPO1209\r\n'),
(134, 'eebb07dea07b76df6f975ea204dc995e', 'КОВРИКИ А/М AILERON 61501 RENAULT LOGAN 06--14 ПОЛИУРЕТАН ЧЕРН. С БОРТ. КОМПЛ. 4ШТ\r\n61501\r\n'),
(135, 'fb4e69b19f6746478b241f7f85c308a9', 'ОСВЕЖИТЕЛЬ КОНДИЦИОНЕРА CARMATE D38RU С БАКТЕРИЦ. ЭФФЕКТОМ. УСТРАНЯЕТ НЕПРИЯТН. ЗАПАХИ. С ИОНАМИ СЕРЕБРА. 40МЛ\r\nD38RU\r\n'),
(136, '0ffd59e9a877f73aa7e7c0758bdc02db', 'КОВРИКИ А/М NORPLAST NPLPO5948 MMC PAJERO IV  07--> ПОЛИУРЕТАН ЧЕРН. С БОРТ. КОМПЛ. 4 ШТ. С КРЕПЛ.\r\nNPLPO5948\r\n'),
(137, '1476cf9ce118f709d7d9227351b0e51c', 'ДЕФЛЕКТОР SIM SVOTIG0832 ОКОН VW TIGUAN 08--> КЛЕЯЩ. КОМПЛ. 4ШТ ТЕМН.\r\nSVOTIG0832\r\n'),
(138, '74b6636647b0c5dd9fd2a2ebb25227ef', 'КОВРИКИ А/М NORPLAST NPLPO0706 BMW X5 E70 07--13/X6 E71; E72 08--> ПОЛИУРЕТАН ЧЕРН. С БОРТ. С КРЕПЛ.\r\nNPLPO0706\r\n'),
(139, 'bd42c2954accdfdc41effa16e7eda63b', 'РОССИЯ\r\n\r\n'),
(140, 'fa615f9d1459a276622a22bb82fb0456', 'ЗНАК АВАРИЙНОЙ ОСТАНОВКИ РОССИЯ 25724 МЕТАЛЛ. ДИАЛУЧ СООТВ. ГОСТ (108104)\r\n25724\r\n'),
(141, '15999cc34f78fcd2e431c7a74076ea7e', 'ЗЕБРА\r\n\r\n'),
(142, '301f0b5b6c7871a6602259bd567f5bc3', 'ИЗОЛЕНТА ЗЕБРА 6320 19ММ Х 25М ЧЕРНАЯ КИТАЙ\r\n6320\r\n'),
(143, 'f335c9f708969e73a6bc8bda08d4f182', 'ДИАЛУЧ\r\n\r\n'),
(144, '923f4f6c057dfc65b0bac5321227659b', 'ПЕРЧАТКИ РАБОЧИЕ ДИАЛУЧ 25643 А/М БЕЛЫЕ С ПВХ ВЫСШ.СОРТ (2ШТ)\r\n25643\r\n'),
(145, 'e308d4a19b2b65cbd7632a4cb9ae7b15', 'КОВРИКИ А/М NORPLAST NPLPO9550 VW TIGUAN 08--> 11--> ПОЛИУРЕТАН ЧЕРН. С БОРТ. КОМПЛ. 4ШТ С КРЕПЛ.\r\nNPLPO9550\r\n'),
(146, '34a7804de9f49e0d12b05f71fdb06def', 'КОВРИКИ А/М NORPLAST NPLPO6310 OPEL ASTRA J 2010--> ПОЛИУРЕТАН ЧЕРН. С БОРТ. КОМПЛ. 4ШТ С КРЕПЛ.\r\nNPLPO6310\r\n'),
(147, '3b30d97a51b99cc3eeea2ab8f3974c88', 'КОВРИКИ А/М NORPLAST NPLPO6171 NISSAN TEANA 2008--13 ПОЛИУРЕТАН ЧЕРН. С БОРТ. КОМПЛ. 4ШТ\r\nNPLPO6171\r\n'),
(148, '626a5d1bd18fcc622fbe4e4e3619a88a', 'НОВОСТИ\r\n\r\n'),
(149, 'cabb3b606988743894da6f4c5ed7b8cc', 'КОНТАКТЫ\r\nПИШИТЕ НАМ ПО ЛЮБОМУ ВОПРОСУ\rОТПРАВИТЬ\r+7 (3522) 63-00-68\nКУРГАН, УЛ. ДЗЕРЖИНСКОГО, 68\nWWW.АВТОМИР45.РФ\r\n'),
(150, '71053ad355dd94491418c6a97bacc689', 'ДОСТАВКА\r\nГЛАВНАЯ\rНОВОСТИ\rДОСТАВКА КУРЬЕРОМ\rРАВНЫМ ОБРАЗОМ СЛОЖИВШАЯСЯ СТРУК- ТУРА ОРГАНИЗАЦИИ ПРЕДСТАВЛЯЕТ СОБОЙ ИНТЕРЕСНЫЙ ЭКСПЕРИМЕНТ ПРОВЕРКИ НАПРАВЛЕНИЙ ПРОГРЕССИВНОГО РАЗВИТИЯ. ПОВСЕДНЕВНАЯ ПРАКТИКА ПОКАЗЫВАЕТ, ЧТО РЕАЛИЗАЦИЯ НАМЕЧЕННЫХ ПЛАНОВЫХ ЗАДАНИЙ ТРЕБУЮТ ОПРЕДЕЛЕНИЯ И УТОЧНЕНИЯ НОВЫХ ПРЕДЛОЖЕНИЙ.\rПОЧТА РОССИИ\rРАВНЫМ ОБРАЗОМ СЛОЖИВШАЯСЯ СТРУК- ТУРА ОРГАНИЗАЦИИ ПРЕДСТАВЛЯЕТ СОБОЙ ИНТЕРЕСНЫЙ ЭКСПЕРИМЕНТ ПРОВЕРКИ НАПРАВЛЕНИЙ ПРОГРЕССИВНОГО РАЗВИТИЯ. ПОВСЕДНЕВНАЯ ПРАКТИКА ПОКАЗЫВАЕТ, ЧТО РЕАЛИЗАЦИЯ НАМЕЧЕННЫХ ПЛАНОВЫХ ЗАДАНИЙ ТРЕБУЮТ ОПРЕДЕЛЕНИЯ И УТОЧНЕНИЯ НОВЫХ ПРЕДЛОЖЕНИЙ.\rСАМОВЫВОЗ ИЗ МАГАЗИНА\rРАВНЫМ ОБРАЗОМ СЛОЖИВШАЯСЯ СТРУК- ТУРА ОРГАНИЗАЦИИ ПРЕДСТАВЛЯЕТ СОБОЙ ИНТЕРЕСНЫЙ ЭКСПЕРИМЕНТ ПРОВЕРКИ НАПРАВЛЕНИЙ ПРОГРЕССИВНОГО РАЗВИТИЯ. ПОВСЕДНЕВНАЯ ПРАКТИКА ПОКАЗЫВАЕТ, ЧТО РЕАЛИЗАЦИЯ НАМЕЧЕННЫХ ПЛАНОВЫХ ЗАДАНИЙ ТРЕБУЮТ ОПРЕДЕЛЕНИЯ И УТОЧНЕНИЯ НОВЫХ ПРЕДЛОЖЕНИЙ.\r\n'),
(151, '2816b94109d0a3aef68b269a0e83c096', 'АВТОМИР45\r\nТОРМОЗНЫЕ СИСТЕМЫ ОТ ВЕДУЩЕГО ПРОИЗВОДИТЕЛЯ\rСКИДКА \r10%\r*\rТОРМОЗНЫЕ СИСТЕМЫ ОТ ВЕДУЩЕГО ПРОИЗВОДИТЕЛЯ\rСКИДКА \r11%\r*\rТОРМОЗНЫЕ СИСТЕМЫ ОТ ВЕДУЩЕГО ПРОИЗВОДИТЕЛЯ\rСКИДКА \r12%\r*\rТОРМОЗНЫЕ СИСТЕМЫ ОТ ВЕДУЩЕГО ПРОИЗВОДИТЕЛЯ\rСКИДКА \r13%\r*\rТОРМОЗНЫЕ СИСТЕМЫ ОТ ВЕДУЩЕГО ПРОИЗВОДИТЕЛЯ\rСКИДКА \r14%\r*\rТОРМОЗНЫЕ СИСТЕМЫ ОТ ВЕДУЩЕГО ПРОИЗВОДИТЕЛЯ\rСКИДКА \r15%\r*\rНОВОСТИ\rРЕМОНТ СВОИМИ РУКАМИ\rРАВНЫМ ОБРАЗОМ СЛОЖИВШАЯСЯ СТРУК- ТУРА ОРГАНИЗАЦИИ ПРЕДСТАВЛЯЕТ СОБОЙ ИНТЕРЕСНЫЙ ЭКСПЕРИМЕНТ ПРОВЕРКИ НАПРАВЛЕНИЙ ПРОГРЕССИВНОГО РАЗВИТИЯ. ПОВСЕДНЕВНАЯ ПРАКТИКА ПОКАЗЫВАЕТ, ЧТО РЕАЛИЗАЦИЯ НАМЕЧЕННЫХ ПЛАНОВЫХ ЗАДАНИЙ ТРЕБУЮТ ОПРЕДЕЛЕНИЯ И УТОЧНЕНИЯ НОВЫХ ПРЕДЛОЖЕНИЙ.\nЧИТАТЬ ДАЛЕЕ...\rРЕМОНТ СВОИМИ РУКАМИ\rРАВНЫМ ОБРАЗОМ СЛОЖИВШАЯСЯ СТРУК- ТУРА ОРГАНИЗАЦИИ ПРЕДСТАВЛЯЕТ СОБОЙ ИНТЕРЕСНЫЙ ЭКСПЕРИМЕНТ ПРОВЕРКИ НАПРАВЛЕНИЙ ПРОГРЕССИВНОГО РАЗВИТИЯ. ПОВСЕДНЕВНАЯ ПРАКТИКА ПОКАЗЫВАЕТ, ЧТО РЕАЛИЗАЦИЯ НАМЕЧЕННЫХ ПЛАНОВЫХ ЗАДАНИЙ ТРЕБУЮТ ОПРЕДЕЛЕНИЯ И УТОЧНЕНИЯ НОВЫХ ПРЕДЛОЖЕНИЙ.\nЧИТАТЬ ДАЛЕЕ...\rРЕМОНТ СВОИМИ РУКАМИ\rРАВНЫМ ОБРАЗОМ СЛОЖИВШАЯСЯ СТРУК- ТУРА ОРГАНИЗАЦИИ ПРЕДСТАВЛЯЕТ СОБОЙ ИНТЕРЕСНЫЙ ЭКСПЕРИМЕНТ ПРОВЕРКИ НАПРАВЛЕНИЙ ПРОГРЕССИВНОГО РАЗВИТИЯ. ПОВСЕДНЕВНАЯ ПРАКТИКА ПОКАЗЫВАЕТ, ЧТО РЕАЛИЗАЦИЯ НАМЕЧЕННЫХ ПЛАНОВЫХ ЗАДАНИЙ ТРЕБУЮТ ОПРЕДЕЛЕНИЯ И УТОЧНЕНИЯ НОВЫХ ПРЕДЛОЖЕНИЙ.\nЧИТАТЬ ДАЛЕЕ...\rСПЕЦИАЛЬНЫЕ ПРЕДЛОЖЕНИЯ\r\n'),
(152, '1499ebe92a23d3f42102a187a9ce8037', 'ЗАПРОС ПО VIN\r\nГЛАВНАЯ\rЗАПРОС\rОТПРАВЬТЕ НАМ ЗАПРОС И МЕНЕДЖЕР СВЯЖЕТЬСЯ С ВАМИ\rРЕМОНТ СВОИМИ РУКАМИ\rРАВНЫМ ОБРАЗОМ СЛОЖИВШАЯСЯ СТРУКТУРА ОРГАНИЗАЦИИ ПРЕДСТАВЛЯЕТ СОБОЙ ИНТЕРЕСНЫЙ ЭКСПЕРИМЕНТ ПРОВЕРКИ НАПРАВЛЕНИЙ ПРОГРЕССИВНОГО РАЗВИТИЯ. ПОВСЕДНЕВНАЯ ПРАКТИКА ПОКАЗЫВАЕТ, ЧТО РЕАЛИЗАЦИЯ НАМЕЧЕННЫХ ПЛАНОВЫХ ЗАДАНИЙ ТРЕБУЮТ ОПРЕДЕЛЕНИЯ И УТОЧНЕНИЯ НОВЫХ ПРЕДЛОЖЕНИЙ.\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_title`
--

CREATE TABLE `b_search_content_title` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `POS` int(11) NOT NULL,
  `WORD` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

--
-- Дамп данных таблицы `b_search_content_title`
--

INSERT INTO `b_search_content_title` (`SEARCH_CONTENT_ID`, `SITE_ID`, `POS`, `WORD`) VALUES
(5, 's1', 0, 'КАТЕГОРИИ'),
(6, 's1', 0, 'ТОВАР'),
(7, 's1', 0, 'КАТЕГОРИИ'),
(24, 's1', 0, 'GATES'),
(26, 's1', 0, 'MMC'),
(27, 's1', 0, 'TOYOTA'),
(28, 's1', 0, 'VERNET'),
(29, 's1', 0, 'DEPO'),
(30, 's1', 0, 'NISSAN'),
(31, 's1', 0, 'OCAP'),
(32, 's1', 0, 'OPEL'),
(33, 's1', 0, 'FRAM'),
(34, 's1', 0, 'BOSCH'),
(35, 's1', 0, 'FEBI'),
(36, 's1', 4, 'LIGHT'),
(36, 's1', 0, 'MTF'),
(37, 's1', 0, 'NORPLAST'),
(38, 's1', 0, 'SVS'),
(39, 's1', 0, 'ALFECO'),
(40, 's1', 0, 'SLIM'),
(41, 's1', 0, 'AIR'),
(41, 's1', 4, 'COUTURE'),
(42, 's1', 0, 'AIRLINE'),
(43, 's1', 0, 'AILERON'),
(44, 's1', 0, 'CARMATE'),
(45, 's1', 0, 'SIM'),
(46, 's1', 44, '0I'),
(46, 's1', 42, '3'),
(46, 's1', 24, '4PK948'),
(46, 's1', 18, 'GATES'),
(46, 's1', 31, 'MMC'),
(46, 's1', 35, 'PAJERO'),
(46, 's1', 0, 'РЕМЕНЬ'),
(46, 's1', 7, 'РУЧЕЙКОВЫЙ'),
(47, 's1', 29, '3'),
(47, 's1', 24, '4PK993'),
(47, 's1', 44, '5I'),
(47, 's1', 18, 'GATES'),
(47, 's1', 31, 'MMC'),
(47, 's1', 35, 'PAJERO'),
(47, 's1', 0, 'РЕМЕНЬ'),
(47, 's1', 7, 'РУЧЕЙКОВЫЙ'),
(48, 's1', 30, '3'),
(48, 's1', 24, '4PK1063'),
(48, 's1', 45, '5I'),
(48, 's1', 18, 'GATES'),
(48, 's1', 32, 'MMC'),
(48, 's1', 36, 'PAJERO'),
(48, 's1', 0, 'РЕМЕНЬ'),
(48, 's1', 7, 'РУЧЕЙКОВЫЙ'),
(49, 's1', 44, '0I'),
(49, 's1', 42, '3'),
(49, 's1', 24, '6462MC'),
(49, 's1', 18, 'GATES'),
(49, 's1', 31, 'MMC'),
(49, 's1', 35, 'PAJERO'),
(49, 's1', 7, 'ГЕНЕРАТОРА'),
(49, 's1', 0, 'РЕМЕНЬ'),
(50, 's1', 45, '0I'),
(50, 's1', 30, '3'),
(50, 's1', 24, '5PK1123'),
(50, 's1', 48, '91'),
(50, 's1', 18, 'GATES'),
(50, 's1', 32, 'MMC'),
(50, 's1', 36, 'PAJERO'),
(50, 's1', 0, 'РЕМЕНЬ'),
(50, 's1', 7, 'РУЧЕЙКОВЫЙ'),
(51, 's1', 50, '2TD'),
(51, 's1', 48, '4'),
(51, 's1', 24, '6220MC'),
(51, 's1', 40, 'CR'),
(51, 's1', 43, 'FJ80'),
(51, 's1', 18, 'GATES'),
(51, 's1', 38, 'L'),
(51, 's1', 31, 'TOYOTA'),
(51, 's1', 7, 'ГЕНЕРАТОРА'),
(51, 's1', 0, 'РЕМЕНЬ'),
(52, 's1', 40, '-94'),
(52, 's1', 37, '0I'),
(52, 's1', 35, '3'),
(52, 's1', 17, '5228XS'),
(52, 's1', 11, 'GATES'),
(52, 's1', 24, 'MMC'),
(52, 's1', 28, 'PAJERO'),
(52, 's1', 7, 'ГРМ'),
(52, 's1', 0, 'РЕМЕНЬ'),
(53, 's1', 39, '-94'),
(53, 's1', 37, '0'),
(53, 's1', 35, '3'),
(53, 's1', 15, 'MD111427'),
(53, 's1', 11, 'MMC'),
(53, 's1', 28, 'PAJERO'),
(53, 's1', 43, 'SOHC'),
(53, 's1', 7, 'ГРМ'),
(53, 's1', 0, 'РЕМЕНЬ'),
(54, 's1', 18, '0'),
(54, 's1', 17, '3'),
(54, 's1', 39, '94-'),
(54, 's1', 15, 'MD307487'),
(54, 's1', 11, 'MMC'),
(54, 's1', 28, 'PAJERO'),
(54, 's1', 43, 'SOHC'),
(54, 's1', 7, 'ГРМ'),
(54, 's1', 0, 'РЕМЕНЬ'),
(55, 's1', 49, '100'),
(55, 's1', 18, '1356819065'),
(55, 's1', 33, '25'),
(55, 's1', 31, '4'),
(55, 's1', 30, '94'),
(55, 's1', 41, 'CR'),
(55, 's1', 44, 'FJ80'),
(55, 's1', 56, 'HDT'),
(55, 's1', 53, 'HZ'),
(55, 's1', 39, 'L'),
(55, 's1', 11, 'TOYOTA'),
(55, 's1', 7, 'ГРМ'),
(55, 's1', 0, 'РЕМЕНЬ'),
(56, 's1', 44, '0I'),
(56, 's1', 42, '3'),
(56, 's1', 49, '5I'),
(56, 's1', 24, '6467MC'),
(56, 's1', 18, 'GATES'),
(56, 's1', 31, 'MMC'),
(56, 's1', 35, 'PAJERO'),
(56, 's1', 7, 'ГЕНЕРАТОРА'),
(56, 's1', 0, 'РЕМЕНЬ'),
(57, 's1', 49, '0'),
(57, 's1', 51, '2'),
(57, 's1', 47, '3'),
(57, 's1', 38, '4-RANNER'),
(57, 's1', 53, '4TD'),
(57, 's1', 24, '6478MC'),
(57, 's1', 18, 'GATES'),
(57, 's1', 31, 'TOYOTA'),
(57, 's1', 7, 'ГЕНЕРАТОРА'),
(57, 's1', 0, 'РЕМЕНЬ'),
(58, 's1', 50, '2TD'),
(58, 's1', 25, '4'),
(58, 's1', 24, '6481MC'),
(58, 's1', 40, 'CR'),
(58, 's1', 43, 'FJ80'),
(58, 's1', 18, 'GATES'),
(58, 's1', 38, 'L'),
(58, 's1', 31, 'TOYOTA'),
(58, 's1', 7, 'ГЕНЕРАТОРА'),
(58, 's1', 0, 'РЕМЕНЬ'),
(59, 's1', 37, '1'),
(59, 's1', 20, '2'),
(59, 's1', 22, '3'),
(59, 's1', 19, '6'),
(59, 's1', 62, '80'),
(59, 's1', 51, '86-00'),
(59, 's1', 77, '96-'),
(59, 's1', 43, '9TD'),
(59, 's1', 65, 'A4'),
(59, 's1', 68, 'A6'),
(59, 's1', 57, 'AUDI'),
(59, 's1', 30, 'PASSAT'),
(59, 's1', 17, 'TH627387J'),
(59, 's1', 10, 'VERNET'),
(59, 's1', 27, 'VW'),
(59, 's1', 0, 'ТЕРМОСТАТ'),
(60, 's1', 16, '2131515RA'),
(60, 's1', 40, '92'),
(60, 's1', 11, 'DEPO'),
(60, 's1', 26, 'ISUZU'),
(60, 's1', 23, 'R'),
(60, 's1', 32, 'TROOPER'),
(60, 's1', 0, 'ПОВОРОТНИК'),
(61, 's1', 31, '93'),
(61, 's1', 35, 'L'),
(61, 's1', 7, 'MMC'),
(61, 's1', 11, 'MR124963'),
(61, 's1', 24, 'PAJERO'),
(61, 's1', 0, 'ФОНАРЬ'),
(62, 's1', 36, '-95'),
(62, 's1', 19, '4'),
(62, 's1', 19, '4851139766'),
(62, 's1', 32, 'RUN'),
(62, 's1', 12, 'TOYOTA'),
(62, 's1', 0, 'АМОРТИЗАТОР'),
(62, 's1', 45, 'ГАЗ'),
(62, 's1', 40, 'ПЕР'),
(63, 's1', 42, '-80'),
(63, 's1', 19, '4851169435'),
(63, 's1', 39, 'CR'),
(63, 's1', 37, 'L'),
(63, 's1', 12, 'TOYOTA'),
(63, 's1', 0, 'АМОРТИЗАТОР'),
(63, 's1', 46, 'ПЕР'),
(64, 's1', 35, '84'),
(64, 's1', 19, 'MB111203'),
(64, 's1', 15, 'MMC'),
(64, 's1', 28, 'PAJERO'),
(64, 's1', 0, 'ВТУЛКА'),
(64, 's1', 7, 'РЕССОРЫ'),
(65, 's1', 35, '91'),
(65, 's1', 19, 'MB584530'),
(65, 's1', 15, 'MMC'),
(65, 's1', 28, 'PAJERO'),
(65, 's1', 0, 'ВТУЛКА'),
(65, 's1', 7, 'РЕССОРЫ'),
(66, 's1', 35, '91'),
(66, 's1', 19, 'MB584531'),
(66, 's1', 15, 'MMC'),
(66, 's1', 28, 'PAJERO'),
(66, 's1', 0, 'ВТУЛКА'),
(66, 's1', 7, 'РЕССОРЫ'),
(67, 's1', 35, '5ДВ'),
(67, 's1', 13, 'M'),
(67, 's1', 17, 'MB598098'),
(67, 's1', 13, 'MMC'),
(67, 's1', 28, 'PAJERO'),
(67, 's1', 39, 'ЗАДН'),
(67, 's1', 5, 'СТАБИЛ'),
(67, 's1', 0, 'ТЯГА'),
(68, 's1', 22, '546137F001'),
(68, 's1', 15, 'NISSAN'),
(68, 's1', 33, 'TERRANO-II'),
(68, 's1', 0, 'ВТУЛКА'),
(68, 's1', 44, 'ЗАДН'),
(68, 's1', 7, 'СТАБИЛ'),
(69, 's1', 57, '18ММ'),
(69, 's1', 51, '2000Г'),
(69, 's1', 22, '54613VB010'),
(69, 's1', 15, 'NISSAN'),
(69, 's1', 33, 'PATROL'),
(69, 's1', 40, 'Y61'),
(69, 's1', 0, 'ВТУЛКА'),
(69, 's1', 44, 'ЗАДН'),
(69, 's1', 7, 'СТАБИЛ'),
(70, 's1', 22, '4'),
(70, 's1', 22, '4881520200'),
(70, 's1', 47, '92-95'),
(70, 's1', 33, 'D25'),
(70, 's1', 39, 'RUNNNER'),
(70, 's1', 15, 'TOYOTA'),
(70, 's1', 0, 'ВТУЛКА'),
(70, 's1', 53, 'ЗАДН'),
(70, 's1', 7, 'СТАБИЛ'),
(71, 's1', 53, '08'),
(71, 's1', 22, '4881526020'),
(71, 's1', 56, '92-'),
(71, 's1', 40, 'CRUISER'),
(71, 's1', 33, 'D25'),
(71, 's1', 48, 'FJ80'),
(71, 's1', 37, 'LN'),
(71, 's1', 15, 'TOYOTA'),
(71, 's1', 0, 'ВТУЛКА'),
(71, 's1', 60, 'ЗАДН'),
(71, 's1', 7, 'СТАБИЛ'),
(72, 's1', 37, '4-RUN'),
(72, 's1', 22, '4881530070'),
(72, 's1', 33, 'D16'),
(72, 's1', 15, 'TOYOTA'),
(72, 's1', 0, 'ВТУЛКА'),
(72, 's1', 43, 'ЗАДН'),
(72, 's1', 7, 'СТАБИЛ'),
(73, 's1', 53, '2ШАЙБЫ'),
(73, 's1', 49, '2ШТ'),
(73, 's1', 44, '91'),
(73, 's1', 28, 'MB831039'),
(73, 's1', 24, 'MMC'),
(73, 's1', 37, 'PAJERO'),
(73, 's1', 0, 'ВТУЛКА'),
(73, 's1', 60, 'ГАЙКА'),
(73, 's1', 15, 'КОНЦЕВАЯ'),
(73, 's1', 7, 'СТАБИЛ'),
(74, 's1', 31, '56112V0100'),
(74, 's1', 24, 'NISSAN'),
(74, 's1', 42, 'PATROL'),
(74, 's1', 49, 'TERRANO'),
(74, 's1', 0, 'ВТУЛКА'),
(74, 's1', 15, 'КОНЦЕВАЯ'),
(74, 's1', 7, 'СТАБИЛ'),
(75, 's1', 31, '4881730010'),
(75, 's1', 45, 'CRUISER'),
(75, 's1', 53, 'FJ80'),
(75, 's1', 42, 'LN'),
(75, 's1', 24, 'TOYOTA'),
(75, 's1', 0, 'ВТУЛКА'),
(75, 's1', 15, 'КОНЦЕВАЯ'),
(75, 's1', 7, 'СТАБИЛ'),
(76, 's1', 31, '4'),
(76, 's1', 31, '4881730020'),
(76, 's1', 48, '93-'),
(76, 's1', 44, 'RUN'),
(76, 's1', 24, 'TOYOTA'),
(76, 's1', 0, 'ВТУЛКА'),
(76, 's1', 15, 'КОНЦЕВАЯ'),
(76, 's1', 7, 'СТАБИЛ'),
(77, 's1', 34, '4'),
(77, 's1', 31, '9094801002'),
(77, 's1', 44, 'RUNNER'),
(77, 's1', 24, 'TOYOTA'),
(77, 's1', 0, 'ВТУЛКА'),
(77, 's1', 15, 'КОНЦЕВАЯ'),
(77, 's1', 7, 'СТАБИЛ'),
(78, 's1', 35, '91'),
(78, 's1', 15, 'MMC'),
(78, 's1', 19, 'MR150092'),
(78, 's1', 28, 'PAJERO'),
(78, 's1', 0, 'ВТУЛКА'),
(78, 's1', 39, 'ПЕР'),
(78, 's1', 7, 'СТАБИЛ'),
(79, 's1', 35, '91'),
(79, 's1', 15, 'MMC'),
(79, 's1', 19, 'MR150093'),
(79, 's1', 28, 'PAJERO'),
(79, 's1', 0, 'ВТУЛКА'),
(79, 's1', 39, 'ПЕР'),
(79, 's1', 7, 'СТАБИЛ'),
(80, 's1', 22, '5'),
(80, 's1', 40, '94'),
(80, 's1', 15, 'MMC'),
(80, 's1', 19, 'MR150095'),
(80, 's1', 28, 'PAJERO'),
(80, 's1', 0, 'ВТУЛКА'),
(80, 's1', 37, 'ДВ'),
(80, 's1', 44, 'ПЕР'),
(80, 's1', 7, 'СТАБИЛ'),
(81, 's1', 28, '2'),
(81, 's1', 43, '4I'),
(81, 's1', 22, '5461342G00'),
(81, 's1', 15, 'NISSAN'),
(81, 's1', 33, 'TERRANO'),
(81, 's1', 0, 'ВТУЛКА'),
(81, 's1', 46, 'ПЕР'),
(81, 's1', 7, 'СТАБИЛ'),
(82, 's1', 48, '0I'),
(82, 's1', 41, '2'),
(82, 's1', 26, '3'),
(82, 's1', 43, '4I'),
(82, 's1', 22, '5461388G00'),
(82, 's1', 53, '7TD'),
(82, 's1', 57, '89'),
(82, 's1', 15, 'NISSAN'),
(82, 's1', 33, 'TERRANO'),
(82, 's1', 0, 'ВТУЛКА'),
(82, 's1', 61, 'ПЕР'),
(82, 's1', 7, 'СТАБИЛ'),
(83, 's1', 22, '546139C105'),
(83, 's1', 48, 'II'),
(83, 's1', 15, 'NISSAN'),
(83, 's1', 40, 'TERRANO'),
(83, 's1', 0, 'ВТУЛКА'),
(83, 's1', 51, 'ПЕР'),
(83, 's1', 7, 'СТАБИЛ'),
(84, 's1', 22, '54613VB002'),
(84, 's1', 15, 'NISSAN'),
(84, 's1', 33, 'PATROL'),
(84, 's1', 40, 'Y61'),
(84, 's1', 0, 'ВТУЛКА'),
(84, 's1', 44, 'ПЕР'),
(84, 's1', 7, 'СТАБИЛ'),
(85, 's1', 48, '100'),
(85, 's1', 22, '4881526250'),
(85, 's1', 40, 'CRUISER'),
(85, 's1', 33, 'D23'),
(85, 's1', 37, 'LN'),
(85, 's1', 15, 'TOYOTA'),
(85, 's1', 0, 'ВТУЛКА'),
(85, 's1', 52, 'ЗАД'),
(85, 's1', 7, 'СТАБИЛ'),
(86, 's1', 22, '4881528080'),
(86, 's1', 40, 'CRUISER'),
(86, 's1', 33, 'D24'),
(86, 's1', 48, 'FJ80'),
(86, 's1', 37, 'LN'),
(86, 's1', 15, 'TOYOTA'),
(86, 's1', 0, 'ВТУЛКА'),
(86, 's1', 53, 'ПЕР'),
(86, 's1', 7, 'СТАБИЛ'),
(87, 's1', 22, '4881530040'),
(87, 's1', 37, 'CARINA'),
(87, 's1', 33, 'D20'),
(87, 's1', 44, 'E'),
(87, 's1', 15, 'TOYOTA'),
(87, 's1', 0, 'ВТУЛКА'),
(87, 's1', 46, 'ПЕР'),
(87, 's1', 7, 'СТАБИЛ'),
(88, 's1', 22, '4'),
(88, 's1', 22, '4881535070'),
(88, 's1', 46, '92-95'),
(88, 's1', 33, 'D27'),
(88, 's1', 39, 'RUNNER'),
(88, 's1', 15, 'TOYOTA'),
(88, 's1', 0, 'ВТУЛКА'),
(88, 's1', 52, 'ПЕР'),
(88, 's1', 7, 'СТАБИЛ'),
(89, 's1', 22, '4881560040'),
(89, 's1', 40, 'CR'),
(89, 's1', 33, 'D26'),
(89, 's1', 44, 'FJ80'),
(89, 's1', 37, 'LN'),
(89, 's1', 15, 'TOYOTA'),
(89, 's1', 0, 'ВТУЛКА'),
(89, 's1', 49, 'ПЕР'),
(89, 's1', 7, 'СТАБИЛ'),
(90, 's1', 22, '4881560050'),
(90, 's1', 40, 'CR'),
(90, 's1', 33, 'D24'),
(90, 's1', 44, 'FJ80'),
(90, 's1', 37, 'LN'),
(90, 's1', 15, 'TOYOTA'),
(90, 's1', 0, 'ВТУЛКА'),
(90, 's1', 49, 'ПЕР'),
(90, 's1', 7, 'СТАБИЛ'),
(91, 's1', 22, '4881560070'),
(91, 's1', 40, 'CR'),
(91, 's1', 33, 'D29'),
(91, 's1', 44, 'FJ80'),
(91, 's1', 37, 'LN'),
(91, 's1', 15, 'TOYOTA'),
(91, 's1', 0, 'ВТУЛКА'),
(91, 's1', 49, 'ПЕР'),
(91, 's1', 7, 'СТАБИЛ'),
(92, 's1', 44, '100'),
(92, 's1', 22, '4881560111'),
(92, 's1', 40, 'CR'),
(92, 's1', 33, 'D27'),
(92, 's1', 37, 'LN'),
(92, 's1', 15, 'TOYOTA'),
(92, 's1', 0, 'ВТУЛКА'),
(92, 's1', 48, 'ПЕР'),
(92, 's1', 7, 'СТАБИЛ'),
(93, 's1', 20, '6'),
(93, 's1', 35, '93'),
(93, 's1', 42, 'L'),
(93, 's1', 13, 'MMC'),
(93, 's1', 17, 'MR267876'),
(93, 's1', 26, 'PAJERO'),
(93, 's1', 38, 'ПЕР'),
(93, 's1', 5, 'СТАБИЛ'),
(93, 's1', 0, 'ТЯГА'),
(94, 's1', 20, '6'),
(94, 's1', 35, '93'),
(94, 's1', 13, 'MMC'),
(94, 's1', 17, 'MR267877'),
(94, 's1', 26, 'PAJERO'),
(94, 's1', 18, 'R'),
(94, 's1', 38, 'ПЕР'),
(94, 's1', 5, 'СТАБИЛ'),
(94, 's1', 0, 'ТЯГА'),
(95, 's1', 38, '91'),
(95, 's1', 48, 'L'),
(95, 's1', 18, 'MB860829'),
(95, 's1', 14, 'MMC'),
(95, 's1', 31, 'PAJERO'),
(95, 's1', 42, 'ВЕРХ'),
(95, 's1', 0, 'ОПОРА'),
(95, 's1', 6, 'ШАРОВАЯ'),
(96, 's1', 38, '91'),
(96, 's1', 18, 'MB860830'),
(96, 's1', 14, 'MMC'),
(96, 's1', 31, 'PAJERO'),
(96, 's1', 35, 'R'),
(96, 's1', 42, 'ВЕРХ'),
(96, 's1', 0, 'ОПОРА'),
(96, 's1', 6, 'ШАРОВАЯ'),
(97, 's1', 38, '91'),
(97, 's1', 47, 'L'),
(97, 's1', 14, 'MMC'),
(97, 's1', 18, 'MR296269'),
(97, 's1', 31, 'PAJERO'),
(97, 's1', 42, 'НИЖ'),
(97, 's1', 0, 'ОПОРА'),
(97, 's1', 6, 'ШАРОВАЯ'),
(98, 's1', 38, '91'),
(98, 's1', 14, 'MMC'),
(98, 's1', 18, 'MR296270'),
(98, 's1', 31, 'PAJERO'),
(98, 's1', 19, 'R'),
(98, 's1', 42, 'НИЖ'),
(98, 's1', 0, 'ОПОРА'),
(98, 's1', 6, 'ШАРОВАЯ'),
(99, 's1', 29, '91'),
(99, 's1', 7, 'M'),
(99, 's1', 11, 'MB109684'),
(99, 's1', 7, 'MMC'),
(99, 's1', 22, 'PAJERO'),
(99, 's1', 2, 'БЛОК'),
(99, 's1', 37, 'НИЖ'),
(99, 's1', 33, 'ПЕР'),
(99, 's1', 41, 'РЫЧ'),
(99, 's1', 0, 'С'),
(100, 's1', 29, '91-6'),
(100, 's1', 34, '93'),
(100, 's1', 7, 'M'),
(100, 's1', 11, 'MB631492'),
(100, 's1', 7, 'MMC'),
(100, 's1', 22, 'PAJERO'),
(100, 's1', 2, 'БЛОК'),
(100, 's1', 37, 'ЗАДН'),
(100, 's1', 42, 'РЫЧ'),
(100, 's1', 0, 'С'),
(101, 's1', 29, '6'),
(101, 's1', 31, '93'),
(101, 's1', 7, 'M'),
(101, 's1', 7, 'MMC'),
(101, 's1', 11, 'MR112891'),
(101, 's1', 22, 'PAJERO'),
(101, 's1', 2, 'БЛОК'),
(101, 's1', 35, 'ЗАДН'),
(101, 's1', 40, 'РЫЧ'),
(101, 's1', 0, 'С'),
(102, 's1', 24, '0193759'),
(102, 's1', 39, '4-RUNNER'),
(102, 's1', 19, 'OCAP'),
(102, 's1', 32, 'TOYOTA'),
(102, 's1', 48, 'ВНЕШНИЙ'),
(102, 's1', 0, 'НАКОНЕЧНИК'),
(102, 's1', 11, 'РУЛЕВОЙ'),
(103, 's1', 26, '4504669135'),
(103, 's1', 39, 'CR'),
(103, 's1', 42, 'FJ80'),
(103, 's1', 37, 'L'),
(103, 's1', 40, 'R'),
(103, 's1', 19, 'TOYOTA'),
(103, 's1', 0, 'НАКОНЕЧНИК'),
(103, 's1', 11, 'РУЛЕВОЙ'),
(104, 's1', 26, '4504769085'),
(104, 's1', 39, 'CR'),
(104, 's1', 42, 'FJ80'),
(104, 's1', 37, 'L'),
(104, 's1', 19, 'TOYOTA'),
(104, 's1', 0, 'НАКОНЕЧНИК'),
(104, 's1', 11, 'РУЛЕВОЙ'),
(105, 's1', 23, '0856024'),
(105, 's1', 36, 'DIESEL'),
(105, 's1', 18, 'OPEL'),
(105, 's1', 8, 'ГЛУШИТЕЛЯ'),
(105, 's1', 0, 'ПОДУШКА'),
(106, 's1', 31, '91'),
(106, 's1', 11, 'MB858466'),
(106, 's1', 7, 'MMC'),
(106, 's1', 24, 'PAJERO'),
(106, 's1', 44, 'ЗАДН'),
(106, 's1', 0, 'РЕМК-Т'),
(106, 's1', 35, 'СУППОРТА'),
(107, 's1', 29, '2'),
(107, 's1', 52, '8TD'),
(107, 's1', 37, 'D250'),
(107, 's1', 18, 'MMC'),
(107, 's1', 22, 'MR317682'),
(107, 's1', 43, 'PAJERO'),
(107, 's1', 0, 'КОРЗИНА'),
(107, 's1', 8, 'СЦЕПЛЕНИЯ'),
(108, 's1', 27, '12'),
(108, 's1', 21, '42'),
(108, 's1', 24, '65'),
(108, 's1', 12, 'MB160578'),
(108, 's1', 8, 'MMC'),
(108, 's1', 34, 'PAJERO'),
(108, 's1', 45, 'МОСТА'),
(108, 's1', 41, 'ПЕР'),
(108, 's1', 0, 'САЛЬНИК'),
(109, 's1', 21, 'MB919210'),
(109, 's1', 17, 'MMC'),
(109, 's1', 34, 'PAJERO'),
(109, 's1', 44, 'КАРДАН'),
(109, 's1', 41, 'НА'),
(109, 's1', 8, 'РАЗДАТКИ'),
(109, 's1', 0, 'САЛЬНИК'),
(110, 's1', 53, '2'),
(110, 's1', 26, '4'),
(110, 's1', 36, 'CHRYSLER'),
(110, 's1', 16, 'FRAM'),
(110, 's1', 21, 'PH3614'),
(110, 's1', 28, 'TOYOTA'),
(110, 's1', 45, 'VOYAGER'),
(110, 's1', 57, 'ВОЛГА'),
(110, 's1', 7, 'МАСЛЯНЫЙ'),
(110, 's1', 0, 'ФИЛЬТР'),
(111, 's1', 32, '2'),
(111, 's1', 34, '5TD'),
(111, 's1', 16, 'FRAM'),
(111, 's1', 28, 'MMC'),
(111, 's1', 21, 'PH6355'),
(111, 's1', 7, 'МАСЛЯНЫЙ'),
(111, 's1', 0, 'ФИЛЬТР'),
(112, 's1', 22, '0986452063'),
(112, 's1', 28, '2'),
(112, 's1', 46, '8TD'),
(112, 's1', 16, 'BOSCH'),
(112, 's1', 33, 'MMC'),
(112, 's1', 37, 'PAJERO'),
(112, 's1', 7, 'МАСЛЯНЫЙ'),
(112, 's1', 0, 'ФИЛЬТР'),
(113, 's1', 46, '-40'),
(113, 's1', 14, '01089'),
(113, 's1', 15, '1'),
(113, 's1', 28, '5L'),
(113, 's1', 50, 'C'),
(113, 's1', 9, 'FEBI'),
(113, 's1', 0, 'АНТИФРИЗ'),
(113, 's1', 31, 'КОНЦЕНТРАТ'),
(113, 's1', 20, 'СИНИЙ'),
(114, 's1', 23, '2'),
(114, 's1', 43, '5TD'),
(114, 's1', 49, '8D'),
(114, 's1', 21, 'MB220900'),
(114, 's1', 17, 'MMC'),
(114, 's1', 34, 'PAJERO'),
(114, 's1', 44, 'TD'),
(114, 's1', 7, 'ТОПЛИВНЫЙ'),
(114, 's1', 0, 'ФИЛЬТР'),
(115, 's1', 18, '3'),
(115, 's1', 38, '5'),
(115, 's1', 16, 'MD311208'),
(115, 's1', 12, 'MMC'),
(115, 's1', 29, 'PAJERO'),
(115, 's1', 3, 'В'),
(115, 's1', 0, 'ПРОВОДА'),
(116, 's1', 47, '-80'),
(116, 's1', 51, '4-RUNNER'),
(116, 's1', 23, '9091901176'),
(116, 's1', 44, 'CR'),
(116, 's1', 34, 'K16RU'),
(116, 's1', 42, 'L'),
(116, 's1', 16, 'T'),
(116, 's1', 16, 'TOYOTA'),
(116, 's1', 6, 'ЗАЖИГАНИЯ'),
(116, 's1', 0, 'СВЕЧА'),
(117, 's1', 56, '12V'),
(117, 's1', 20, '2'),
(117, 's1', 46, '5000K'),
(117, 's1', 52, '55W'),
(117, 's1', 16, 'HVN1203'),
(117, 's1', 10, 'LIGHT'),
(117, 's1', 6, 'MTF'),
(117, 's1', 24, 'VANADIUM'),
(117, 's1', 33, 'БЕЛО-ГОЛУБОЙ'),
(117, 's1', 60, 'КОМПЛЕКТ'),
(117, 's1', 0, 'ЛАМПА'),
(117, 's1', 71, 'ШТ'),
(118, 's1', 44, '06--'),
(118, 's1', 80, '4ШТ'),
(118, 's1', 36, 'CORSA'),
(118, 's1', 42, 'D'),
(118, 's1', 12, 'NORPLAST'),
(118, 's1', 21, 'NPLPO6312'),
(118, 's1', 31, 'OPEL'),
(118, 's1', 8, 'А'),
(118, 's1', 67, 'БОРТ'),
(118, 's1', 0, 'КОВРИКИ'),
(118, 's1', 73, 'КОМПЛ'),
(118, 's1', 86, 'КРЕПЛ'),
(118, 's1', 10, 'М'),
(118, 's1', 50, 'ПОЛИУР-Н'),
(118, 's1', 65, 'С'),
(118, 's1', 59, 'ЧЕРН'),
(119, 's1', 60, '12V'),
(119, 's1', 20, '2'),
(119, 's1', 51, '4000K55W'),
(119, 's1', 34, '80'),
(119, 's1', 24, 'ARGENTUM'),
(119, 's1', 16, 'H8A1211'),
(119, 's1', 10, 'LIGHT'),
(119, 's1', 6, 'MTF'),
(119, 's1', 38, 'БОЛЬШЕ'),
(119, 's1', 64, 'КОМПЛЕКТ'),
(119, 's1', 0, 'ЛАМПА'),
(119, 's1', 45, 'СВЕТА'),
(119, 's1', 75, 'ШТ'),
(120, 's1', 10, '0210043000'),
(120, 's1', 41, '35W'),
(120, 's1', 21, '5000K'),
(120, 's1', 27, 'CLASSIC'),
(120, 's1', 45, 'D4S'),
(120, 's1', 6, 'SVS'),
(120, 's1', 35, 'XENON'),
(120, 's1', 0, 'ЛАМПА'),
(121, 's1', 77, '06--12'),
(121, 's1', 42, '07--'),
(121, 's1', 24, '1'),
(121, 's1', 57, '10---'),
(121, 's1', 24, '1402'),
(121, 's1', 115, '2ММ'),
(121, 's1', 55, '8'),
(121, 's1', 17, 'ALFECO'),
(121, 's1', 49, 'ASX'),
(121, 's1', 93, 'D5'),
(121, 's1', 86, 'DELICA'),
(121, 's1', 33, 'LANCER'),
(121, 's1', 29, 'MMC'),
(121, 's1', 64, 'OUTLANDER'),
(121, 's1', 40, 'X'),
(121, 's1', 74, 'XL'),
(121, 's1', 7, 'ДВИГАТЕЛЯ'),
(121, 's1', 0, 'ЗАЩИТА'),
(121, 's1', 105, 'КПП'),
(121, 's1', 121, 'КРЕПЛ'),
(121, 's1', 109, 'С'),
(121, 's1', 109, 'СТАЛЬ'),
(122, 's1', 43, '08--'),
(122, 's1', 39, '308'),
(122, 's1', 82, '4ШТ'),
(122, 's1', 12, 'NORPLAST'),
(122, 's1', 21, 'NPLPO6438'),
(122, 's1', 31, 'PEUGEOT'),
(122, 's1', 8, 'А'),
(122, 's1', 69, 'БОРТ'),
(122, 's1', 0, 'КОВРИКИ'),
(122, 's1', 75, 'КОМПЛ'),
(122, 's1', 10, 'М'),
(122, 's1', 50, 'ПОЛИУРЕТАН'),
(122, 's1', 67, 'С'),
(122, 's1', 61, 'ЧЕРН'),
(123, 's1', 40, '05--10'),
(123, 's1', 75, '4'),
(123, 's1', 34, 'JETTA'),
(123, 's1', 12, 'NORPLAST'),
(123, 's1', 21, 'NPLPO9523'),
(123, 's1', 31, 'VW'),
(123, 's1', 8, 'А'),
(123, 's1', 63, 'БОРТ'),
(123, 's1', 0, 'КОВРИКИ'),
(123, 's1', 68, 'КОМПЛ'),
(123, 's1', 83, 'КРЕПЛ'),
(123, 's1', 10, 'М'),
(123, 's1', 47, 'ПОЛИУР'),
(123, 's1', 61, 'С'),
(123, 's1', 55, 'ЧЕРН'),
(123, 's1', 77, 'ШТ'),
(124, 's1', 51, '8'),
(124, 's1', 24, 'SLIM'),
(124, 's1', 29, 'SLMV56'),
(124, 's1', 14, 'ДЕФЛЕКТОР'),
(124, 's1', 57, 'ЖИДКИЙ'),
(124, 's1', 36, 'ЗЕЛЕНОЕ'),
(124, 's1', 53, 'МЛ'),
(124, 's1', 11, 'НА'),
(124, 's1', 0, 'ОСВЕЖИТЕЛЬ'),
(124, 's1', 44, 'ЯБЛОКО'),
(125, 's1', 92, '4ШТ'),
(125, 's1', 55, '95-02'),
(125, 's1', 31, 'MB'),
(125, 's1', 34, 'MERCEDES-BENZ'),
(125, 's1', 12, 'NORPLAST'),
(125, 's1', 21, 'NPLPO5621'),
(125, 's1', 48, 'W210'),
(125, 's1', 8, 'А'),
(125, 's1', 80, 'БОРТ'),
(125, 's1', 0, 'КОВРИКИ'),
(125, 's1', 86, 'КОМПЛ'),
(125, 's1', 99, 'КРЕПЛ'),
(125, 's1', 10, 'М'),
(125, 's1', 61, 'ПОЛИУРЕТАН'),
(125, 's1', 78, 'С'),
(125, 's1', 72, 'ЧЕРН'),
(126, 's1', 39, '206'),
(126, 's1', 81, '4ШТ'),
(126, 's1', 43, '98--09'),
(126, 's1', 12, 'NORPLAST'),
(126, 's1', 21, 'NPLPO6426'),
(126, 's1', 31, 'PEUGEOT'),
(126, 's1', 8, 'А'),
(126, 's1', 68, 'БОРТ'),
(126, 's1', 0, 'КОВРИКИ'),
(126, 's1', 74, 'КОМПЛ'),
(126, 's1', 10, 'М'),
(126, 's1', 50, 'ПОЛИУРЕТАН'),
(126, 's1', 66, 'С'),
(126, 's1', 61, 'ЧЕРН'),
(127, 's1', 21, 'AIR'),
(127, 's1', 33, 'AIR5'),
(127, 's1', 25, 'COUTURE'),
(127, 's1', 56, 'CRISTIAN'),
(127, 's1', 65, 'DIOR'),
(127, 's1', 45, 'FAHRENHEIT'),
(127, 's1', 38, 'АРОМАТ'),
(127, 's1', 0, 'ОСВЕЖИТЕЛЬ'),
(127, 's1', 11, 'ПОДВЕСНОЙ'),
(128, 's1', 82, '-РУЛЕТКА'),
(128, 's1', 33, '1'),
(128, 's1', 68, '12В'),
(128, 's1', 72, '24В'),
(128, 's1', 60, '8'),
(128, 's1', 28, 'ACHM01'),
(128, 's1', 20, 'AIRLINE'),
(128, 's1', 8, 'В'),
(128, 's1', 41, 'ДЛЯ'),
(128, 's1', 11, 'ЗАРЯДНОЕ'),
(128, 's1', 45, 'МОБ'),
(128, 's1', 50, 'ТЕЛЕФОНОВ'),
(128, 's1', 35, 'УНИВ'),
(128, 's1', 0, 'УСТРОЙСТВО'),
(128, 's1', 77, 'ШНУР'),
(129, 's1', 21, 'AIR'),
(129, 's1', 33, 'AIR11'),
(129, 's1', 25, 'COUTURE'),
(129, 's1', 50, 'DUPONT'),
(129, 's1', 57, 'ESSENCE'),
(129, 's1', 75, 'HOMME'),
(129, 's1', 70, 'POUR'),
(129, 's1', 65, 'PURE'),
(129, 's1', 46, 'S'),
(129, 's1', 28, 'T'),
(129, 's1', 39, 'АРОМАТ'),
(129, 's1', 0, 'ОСВЕЖИТЕЛЬ'),
(129, 's1', 11, 'ПОДВЕСНОЙ'),
(130, 's1', 44, '10--'),
(130, 's1', 82, '4ШТ'),
(130, 's1', 12, 'NORPLAST'),
(130, 's1', 21, 'NPLPO8548'),
(130, 's1', 31, 'SUZUKI'),
(130, 's1', 38, 'SWIFT'),
(130, 's1', 8, 'А'),
(130, 's1', 69, 'БОРТ'),
(130, 's1', 0, 'КОВРИКИ'),
(130, 's1', 75, 'КОМПЛ'),
(130, 's1', 88, 'КРЕПЛ'),
(130, 's1', 10, 'М'),
(130, 's1', 50, 'ПОЛИУРЕТАН'),
(130, 's1', 67, 'С'),
(130, 's1', 61, 'ЧЕРН'),
(131, 's1', 45, 'ACQUA'),
(131, 's1', 21, 'AIR'),
(131, 's1', 33, 'AIR3'),
(131, 's1', 66, 'ARMANI'),
(131, 's1', 25, 'COUTURE'),
(131, 's1', 51, 'DI'),
(131, 's1', 54, 'GIO'),
(131, 's1', 58, 'GIORGIO'),
(131, 's1', 38, 'АРОМАТ'),
(131, 's1', 0, 'ОСВЕЖИТЕЛЬ'),
(131, 's1', 11, 'ПОДВЕСНОЙ'),
(132, 's1', 21, 'AIR'),
(132, 's1', 33, 'AIR15'),
(132, 's1', 53, 'AZZARO'),
(132, 's1', 46, 'CHROME'),
(132, 's1', 25, 'COUTURE'),
(132, 's1', 39, 'АРОМАТ'),
(132, 's1', 0, 'ОСВЕЖИТЕЛЬ'),
(132, 's1', 11, 'ПОДВЕСНОЙ'),
(133, 's1', 47, '06--'),
(133, 's1', 84, '4ШТ'),
(133, 's1', 31, 'CHEVROLET'),
(133, 's1', 41, 'EPICA'),
(133, 's1', 12, 'NORPLAST'),
(133, 's1', 21, 'NPLPO1209'),
(133, 's1', 8, 'А'),
(133, 's1', 71, 'БОРТ'),
(133, 's1', 0, 'КОВРИКИ'),
(133, 's1', 90, 'КРЕПЛ'),
(133, 's1', 77, 'КРМПЛ'),
(133, 's1', 10, 'М'),
(133, 's1', 52, 'ПОЛИУРЕТАН'),
(133, 's1', 69, 'С'),
(133, 's1', 63, 'ЧЕРН'),
(134, 's1', 40, '06--14'),
(134, 's1', 79, '4ШТ'),
(134, 's1', 20, '61501'),
(134, 's1', 12, 'AILERON'),
(134, 's1', 34, 'LOGAN'),
(134, 's1', 26, 'RENAULT'),
(134, 's1', 8, 'А'),
(134, 's1', 66, 'БОРТ'),
(134, 's1', 0, 'КОВРИКИ'),
(134, 's1', 72, 'КОМПЛ'),
(134, 's1', 10, 'М'),
(134, 's1', 47, 'ПОЛИУРЕТАН'),
(134, 's1', 64, 'С'),
(134, 's1', 58, 'ЧЕРН'),
(135, 's1', 106, '40МЛ'),
(135, 's1', 24, 'CARMATE'),
(135, 's1', 32, 'D38RU'),
(135, 's1', 40, 'БАКТЕРИЦ'),
(135, 's1', 80, 'ЗАПАХИ'),
(135, 's1', 90, 'ИОНАМИ'),
(135, 's1', 11, 'КОНДИЦИОНЕРА'),
(135, 's1', 70, 'НЕПРИЯТН'),
(135, 's1', 0, 'ОСВЕЖИТЕЛЬ'),
(135, 's1', 1, 'С'),
(135, 's1', 97, 'СЕРЕБРА'),
(135, 's1', 60, 'УСТРАНЯЕТ'),
(135, 's1', 50, 'ЭФФЕКТОМ'),
(136, 's1', 46, '07--'),
(136, 's1', 28, '4'),
(136, 's1', 42, 'IV'),
(136, 's1', 31, 'MMC'),
(136, 's1', 12, 'NORPLAST'),
(136, 's1', 21, 'NPLPO5948'),
(136, 's1', 35, 'PAJERO'),
(136, 's1', 8, 'А'),
(136, 's1', 71, 'БОРТ'),
(136, 's1', 0, 'КОВРИКИ'),
(136, 's1', 77, 'КОМПЛ'),
(136, 's1', 92, 'КРЕПЛ'),
(136, 's1', 10, 'М'),
(136, 's1', 52, 'ПОЛИУРЕТАН'),
(136, 's1', 69, 'С'),
(136, 's1', 63, 'ЧЕРН'),
(136, 's1', 86, 'ШТ'),
(137, 's1', 40, '08--'),
(137, 's1', 60, '4ШТ'),
(137, 's1', 10, 'SIM'),
(137, 's1', 14, 'SVOTIG0832'),
(137, 's1', 33, 'TIGUAN'),
(137, 's1', 30, 'VW'),
(137, 's1', 0, 'ДЕФЛЕКТОР'),
(137, 's1', 46, 'КЛЕЯЩ'),
(137, 's1', 53, 'КОМПЛ'),
(137, 's1', 25, 'ОКОН'),
(137, 's1', 64, 'ТЕМН'),
(138, 's1', 42, '07--13'),
(138, 's1', 61, '08--'),
(138, 's1', 31, 'BMW'),
(138, 's1', 38, 'E70'),
(138, 's1', 52, 'E71'),
(138, 's1', 57, 'E72'),
(138, 's1', 12, 'NORPLAST'),
(138, 's1', 21, 'NPLPO0706'),
(138, 's1', 35, 'X5'),
(138, 's1', 49, 'X6'),
(138, 's1', 8, 'А'),
(138, 's1', 86, 'БОРТ'),
(138, 's1', 0, 'КОВРИКИ'),
(138, 's1', 94, 'КРЕПЛ'),
(138, 's1', 10, 'М'),
(138, 's1', 67, 'ПОЛИУРЕТАН'),
(138, 's1', 84, 'С'),
(138, 's1', 78, 'ЧЕРН'),
(139, 's1', 0, 'РОССИЯ'),
(140, 's1', 66, '108104'),
(140, 's1', 32, '25724'),
(140, 's1', 5, 'АВАРИЙНОЙ'),
(140, 's1', 60, 'ГОСТ'),
(140, 's1', 46, 'ДИАЛУЧ'),
(140, 's1', 0, 'ЗНАК'),
(140, 's1', 38, 'МЕТАЛЛ'),
(140, 's1', 15, 'ОСТАНОВКИ'),
(140, 's1', 25, 'РОССИЯ'),
(140, 's1', 53, 'СООТВ'),
(141, 's1', 0, 'ЗЕБРА'),
(142, 's1', 20, '19ММ'),
(142, 's1', 27, '25М'),
(142, 's1', 15, '6320'),
(142, 's1', 9, 'ЗЕБРА'),
(142, 's1', 0, 'ИЗОЛЕНТА'),
(142, 's1', 38, 'КИТАЙ'),
(142, 's1', 25, 'Х'),
(142, 's1', 31, 'ЧЕРНАЯ'),
(143, 's1', 0, 'ДИАЛУЧ'),
(144, 's1', 24, '25643'),
(144, 's1', 57, '2ШТ'),
(144, 's1', 4, 'А'),
(144, 's1', 34, 'БЕЛЫЕ'),
(144, 's1', 46, 'ВЫСШ'),
(144, 's1', 17, 'ДИАЛУЧ'),
(144, 's1', 32, 'М'),
(144, 's1', 42, 'ПВХ'),
(144, 's1', 0, 'ПЕРЧАТКИ'),
(144, 's1', 9, 'РАБОЧИЕ'),
(144, 's1', 40, 'С'),
(144, 's1', 51, 'СОРТ'),
(145, 's1', 41, '08--'),
(145, 's1', 47, '11--'),
(145, 's1', 85, '4ШТ'),
(145, 's1', 12, 'NORPLAST'),
(145, 's1', 21, 'NPLPO9550'),
(145, 's1', 34, 'TIGUAN'),
(145, 's1', 31, 'VW'),
(145, 's1', 8, 'А'),
(145, 's1', 72, 'БОРТ'),
(145, 's1', 0, 'КОВРИКИ'),
(145, 's1', 78, 'КОМПЛ'),
(145, 's1', 91, 'КРЕПЛ'),
(145, 's1', 10, 'М'),
(145, 's1', 53, 'ПОЛИУРЕТАН'),
(145, 's1', 70, 'С'),
(145, 's1', 64, 'ЧЕРН'),
(146, 's1', 44, '2010--'),
(146, 's1', 84, '4ШТ'),
(146, 's1', 36, 'ASTRA'),
(146, 's1', 42, 'J'),
(146, 's1', 12, 'NORPLAST'),
(146, 's1', 21, 'NPLPO6310'),
(146, 's1', 31, 'OPEL'),
(146, 's1', 8, 'А'),
(146, 's1', 71, 'БОРТ'),
(146, 's1', 0, 'КОВРИКИ'),
(146, 's1', 77, 'КОМПЛ'),
(146, 's1', 90, 'КРЕПЛ'),
(146, 's1', 10, 'М'),
(146, 's1', 52, 'ПОЛИУРЕТАН'),
(146, 's1', 69, 'С'),
(146, 's1', 63, 'ЧЕРН'),
(147, 's1', 44, '2008--13'),
(147, 's1', 85, '4ШТ'),
(147, 's1', 31, 'NISSAN'),
(147, 's1', 12, 'NORPLAST'),
(147, 's1', 21, 'NPLPO6171'),
(147, 's1', 38, 'TEANA'),
(147, 's1', 8, 'А'),
(147, 's1', 72, 'БОРТ'),
(147, 's1', 0, 'КОВРИКИ'),
(147, 's1', 78, 'КОМПЛ'),
(147, 's1', 10, 'М'),
(147, 's1', 53, 'ПОЛИУРЕТАН'),
(147, 's1', 70, 'С'),
(147, 's1', 64, 'ЧЕРН'),
(148, 's1', 0, 'НОВОСТИ'),
(149, 's1', 0, 'КОНТАКТЫ'),
(150, 's1', 0, 'ДОСТАВКА'),
(151, 's1', 0, 'АВТОМИР45'),
(152, 's1', 10, 'VIN'),
(152, 's1', 0, 'ЗАПРОС'),
(152, 's1', 7, 'ПО');

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_custom_rank`
--

CREATE TABLE `b_search_custom_rank` (
  `ID` int(11) NOT NULL,
  `APPLIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RANK` int(11) NOT NULL DEFAULT '0',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `PARAM1` text COLLATE utf8_unicode_ci,
  `PARAM2` text COLLATE utf8_unicode_ci,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_phrase`
--

CREATE TABLE `b_search_phrase` (
  `ID` int(18) NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  `PAGES` int(11) NOT NULL,
  `SESSION_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO` text COLLATE utf8_unicode_ci,
  `URL_TO_404` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_SESS_ID` int(18) DEFAULT NULL,
  `EVENT1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_search_phrase`
--

INSERT INTO `b_search_phrase` (`ID`, `TIMESTAMP_X`, `SITE_ID`, `RESULT_COUNT`, `PAGES`, `SESSION_ID`, `PHRASE`, `TAGS`, `URL_TO`, `URL_TO_404`, `URL_TO_SITE_ID`, `STAT_SESS_ID`, `EVENT1`) VALUES
(1, '2017-08-22 23:13:25', 's1', 0, 0, 'f63aac63fc7420aa55fbd89c52045efd', '4зл948', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_stem`
--

CREATE TABLE `b_search_stem` (
  `ID` int(11) NOT NULL,
  `STEM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_search_stem`
--

INSERT INTO `b_search_stem` (`ID`, `STEM`) VALUES
(288, '-40'),
(160, '-80'),
(118, '-94'),
(156, '-95'),
(383, '-РУЛЕТК'),
(284, '01089'),
(249, '0193759'),
(323, '0210043000'),
(350, '05--10'),
(311, '06--'),
(337, '06--12'),
(410, '06--14'),
(332, '07--'),
(432, '07--13'),
(186, '08'),
(346, '08--'),
(256, '0856024'),
(282, '0986452063'),
(104, '0I'),
(518, '10'),
(393, '10--'),
(334, '10---'),
(126, '100'),
(445, '108104'),
(519, '11'),
(460, '11--'),
(269, '12'),
(305, '12V'),
(380, '12В'),
(520, '13'),
(123, '1356819065'),
(521, '14'),
(330, '1402'),
(522, '15'),
(178, '18ММ'),
(449, '19ММ'),
(177, '2000Г'),
(466, '2008--13'),
(463, '2010--'),
(365, '206'),
(146, '2131515RA'),
(381, '24В'),
(125, '25'),
(454, '25643'),
(440, '25724'),
(450, '25М'),
(115, '2TD'),
(342, '2ММ'),
(194, '2ШАЙБ'),
(193, '2ШТ'),
(345, '308'),
(474, '3522'),
(326, '35W'),
(131, '4-RANNER'),
(190, '4-RUN'),
(250, '4-RUNNER'),
(322, '4000K55W'),
(420, '40МЛ'),
(267, '42'),
(252, '4504669135'),
(253, '4504769085'),
(154, '4851139766'),
(159, '4851169435'),
(179, '4881520200'),
(183, '4881526020'),
(215, '4881526250'),
(218, '4881528080'),
(220, '4881530040'),
(188, '4881530070'),
(223, '4881535070'),
(225, '4881560040'),
(227, '4881560050'),
(228, '4881560070'),
(230, '4881560111'),
(198, '4881730010'),
(199, '4881730020'),
(208, '4I'),
(107, '4PK1063'),
(80, '4PK948'),
(105, '4PK993'),
(132, '4TD'),
(316, '4ШТ'),
(303, '5000K'),
(117, '5228XS'),
(207, '5461342G00'),
(172, '546137F001'),
(209, '5461388G00'),
(212, '546139C105'),
(214, '54613VB002'),
(174, '54613VB010'),
(304, '55W'),
(196, '56112V0100'),
(106, '5I'),
(286, '5L'),
(110, '5PK1123'),
(281, '5TD'),
(170, '5ДВ'),
(407, '61501'),
(112, '6220MC'),
(475, '63-00-68'),
(448, '6320'),
(109, '6462MC'),
(129, '6467MC'),
(130, '6478MC'),
(133, '6481MC'),
(268, '65'),
(74, '650'),
(479, '68'),
(210, '7TD'),
(141, '80'),
(164, '84'),
(139, '86-00'),
(211, '89'),
(291, '8D'),
(264, '8TD'),
(297, '9091901176'),
(201, '9094801002'),
(111, '91'),
(245, '91-6'),
(149, '92'),
(187, '92-'),
(182, '92-95'),
(152, '93'),
(200, '93-'),
(124, '94'),
(122, '94-'),
(363, '95-02'),
(144, '96-'),
(366, '98--09'),
(138, '9TD'),
(142, 'A4'),
(143, 'A6'),
(375, 'ACHM01'),
(395, 'ACQUA'),
(20, 'ADIPISCING'),
(22, 'AENEAN'),
(98, 'AILERON'),
(95, 'AIR'),
(384, 'AIR11'),
(400, 'AIR15'),
(394, 'AIR3'),
(368, 'AIR5'),
(97, 'AIRLINE'),
(93, 'ALFECO'),
(56, 'ALIQUET'),
(18, 'AMET'),
(58, 'ARCU'),
(319, 'ARGENTUM'),
(399, 'ARMANI'),
(462, 'ASTRA'),
(333, 'ASX'),
(140, 'AUDI'),
(402, 'AZZARO'),
(429, 'BMW'),
(87, 'BOSCH'),
(222, 'CARINA'),
(99, 'CARMATE'),
(404, 'CHEVROLET'),
(401, 'CHROME'),
(277, 'CHRYSLER'),
(324, 'CLASSIC'),
(23, 'COMMODO'),
(19, 'CONSECTETUER'),
(50, 'CONSEQUAT'),
(310, 'CORSA'),
(96, 'COUTURE'),
(113, 'CR'),
(70, 'CRAS'),
(371, 'CRISTIAN'),
(185, 'CRUISER'),
(27, 'CUM'),
(189, 'D16'),
(221, 'D20'),
(216, 'D23'),
(219, 'D24'),
(180, 'D25'),
(263, 'D250'),
(226, 'D26'),
(224, 'D27'),
(229, 'D29'),
(412, 'D38RU'),
(327, 'D4S'),
(339, 'D5'),
(71, 'DAPIBUS'),
(338, 'DELICA'),
(82, 'DEPO'),
(396, 'DI'),
(66, 'DICTUM'),
(257, 'DIESEL'),
(372, 'DIOR'),
(33, 'DIS'),
(16, 'DOLOR'),
(39, 'DONEC'),
(385, 'DUPONT'),
(431, 'E70'),
(434, 'E71'),
(435, 'E72'),
(25, 'EGET'),
(73, 'ELEM'),
(21, 'ELIT'),
(51, 'ENIM'),
(405, 'EPICA'),
(386, 'ESSENCE'),
(31, 'ET'),
(45, 'EU'),
(370, 'FAHRENHEIT'),
(88, 'FEBI'),
(41, 'FELIS'),
(114, 'FJ80'),
(86, 'FRAM'),
(54, 'FRINGILLA'),
(1, 'GATES'),
(397, 'GIO'),
(398, 'GIORGIO'),
(318, 'H8A1211'),
(128, 'HDT'),
(6, 'HERE'),
(389, 'HOMME'),
(300, 'HVN1203'),
(127, 'HZ'),
(213, 'II'),
(62, 'IMPERDIET'),
(59, 'IN'),
(68, 'INTEGER'),
(15, 'IPSUM'),
(147, 'ISUZU'),
(422, 'IV'),
(349, 'JETTA'),
(53, 'JUSTO'),
(298, 'K16RU'),
(331, 'LANCER'),
(90, 'LIGHT'),
(24, 'LIGULA'),
(184, 'LN'),
(409, 'LOGAN'),
(14, 'LOREM'),
(32, 'MAGNIS'),
(26, 'MASSA'),
(360, 'MB'),
(242, 'MB109684'),
(163, 'MB111203'),
(266, 'MB160578'),
(290, 'MB220900'),
(165, 'MB584530'),
(166, 'MB584531'),
(169, 'MB598098'),
(244, 'MB631492'),
(192, 'MB831039'),
(259, 'MB858466'),
(235, 'MB860829'),
(237, 'MB860830'),
(272, 'MB919210'),
(119, 'MD111427'),
(121, 'MD307487'),
(294, 'MD311208'),
(361, 'MERCEDES-BENZ'),
(2, 'MMC'),
(67, 'MOLLIS'),
(35, 'MONTES'),
(246, 'MR112891'),
(151, 'MR124963'),
(203, 'MR150092'),
(204, 'MR150093'),
(205, 'MR150095'),
(231, 'MR267876'),
(232, 'MR267877'),
(238, 'MR296269'),
(240, 'MR296270'),
(262, 'MR317682'),
(89, 'MTF'),
(38, 'MUS'),
(36, 'NASCETUR'),
(29, 'NATOQUE'),
(43, 'NEC'),
(83, 'NISSAN'),
(91, 'NORPLAST'),
(428, 'NPLPO0706'),
(403, 'NPLPO1209'),
(359, 'NPLPO5621'),
(421, 'NPLPO5948'),
(464, 'NPLPO6171'),
(461, 'NPLPO6310'),
(309, 'NPLPO6312'),
(364, 'NPLPO6426'),
(343, 'NPLPO6438'),
(390, 'NPLPO8548'),
(348, 'NPLPO9523'),
(459, 'NPLPO9550'),
(49, 'NULLA'),
(65, 'NULLAM'),
(84, 'OCAP'),
(85, 'OPEL'),
(335, 'OUTLANDER'),
(103, 'PAJERO'),
(34, 'PARTURIENT'),
(137, 'PASSAT'),
(175, 'PATROL'),
(52, 'PEDE'),
(44, 'PELLENTESQUE'),
(30, 'PENATIBUS'),
(344, 'PEUGEOT'),
(276, 'PH3614'),
(280, 'PH6355'),
(388, 'POUR'),
(46, 'PRETIUM'),
(387, 'PURE'),
(40, 'QUAM'),
(47, 'QUIS'),
(408, 'RENAULT'),
(60, 'RHONCUS'),
(37, 'RIDICULUS'),
(155, 'RUN'),
(202, 'RUNNER'),
(181, 'RUNNNER'),
(48, 'SEM'),
(100, 'SIM'),
(17, 'SIT'),
(94, 'SLIM'),
(354, 'SLMV56'),
(28, 'SOCIIS'),
(120, 'SOHC'),
(391, 'SUZUKI'),
(423, 'SVOTIG0832'),
(92, 'SVS'),
(392, 'SWIFT'),
(292, 'TD'),
(465, 'TEANA'),
(197, 'TERRANO'),
(173, 'TERRANO-II'),
(5, 'TEXT'),
(135, 'TH627387J'),
(425, 'TIGUAN'),
(69, 'TINCIDUNT'),
(3, 'TOYOTA'),
(148, 'TROOPER'),
(42, 'ULTRICIES'),
(61, 'UT'),
(301, 'VANADIUM'),
(55, 'VEL'),
(63, 'VENENATIS'),
(81, 'VERNET'),
(529, 'VIN'),
(64, 'VITAE'),
(72, 'VIVAMUS'),
(278, 'VOYAGER'),
(57, 'VULPUTATE'),
(136, 'VW'),
(362, 'W210'),
(430, 'X5'),
(433, 'X6'),
(325, 'XENON'),
(336, 'XL'),
(176, 'Y61'),
(12, 'А2143252'),
(438, 'АВАРИЙН'),
(480, 'АВТОМИР45'),
(78, 'АКСЕССУАР'),
(153, 'АМОРТИЗАТОР'),
(283, 'АНТИФРИЗ'),
(369, 'АРОМАТ'),
(11, 'АРТИКУЛ'),
(413, 'БАКТЕРИЦ'),
(455, 'БЕЛ'),
(302, 'БЕЛО-ГОЛУБ'),
(241, 'БЛОК'),
(320, 'БОЛЬШ'),
(314, 'БОРТ'),
(515, 'ВЕДУЩ'),
(236, 'ВЕРХ'),
(251, 'ВНЕШН'),
(279, 'ВОЛГ'),
(472, 'ВОПРОС'),
(161, 'ВТУЛК'),
(457, 'ВЫСШ'),
(158, 'ГАЗ'),
(195, 'ГАЙК'),
(108, 'ГЕНЕРАТОР'),
(7, 'ГЛАВН'),
(255, 'ГЛУШИТЕЛ'),
(444, 'ГОСТ'),
(116, 'ГРМ'),
(526, 'ДАЛ'),
(206, 'ДВ'),
(329, 'ДВИГАТЕЛ'),
(353, 'ДЕФЛЕКТОР'),
(478, 'ДЗЕРЖИНСК'),
(442, 'ДИАЛУЧ'),
(482, 'ДОСТАВК'),
(358, 'ЖИДК'),
(217, 'ЗАД'),
(504, 'ЗАДАН'),
(171, 'ЗАДН'),
(296, 'ЗАЖИГАН'),
(417, 'ЗАПАХ'),
(528, 'ЗАПРОС'),
(374, 'ЗАРЯДН'),
(328, 'ЗАЩИТ'),
(446, 'ЗЕБР'),
(355, 'ЗЕЛЕН'),
(437, 'ЗНАК'),
(447, 'ИЗОЛЕНТ'),
(492, 'ИНТЕРЕСН'),
(418, 'ИОН'),
(273, 'КАРДА'),
(4, 'КАТАЛОГ'),
(9, 'КАТЕГОР'),
(451, 'КИТА'),
(426, 'КЛЕЯЩ'),
(308, 'КОВРИК'),
(315, 'КОМПЛ'),
(306, 'КОМПЛЕКТ'),
(411, 'КОНДИЦИОНЕР'),
(468, 'КОНТАКТ'),
(191, 'КОНЦЕВ'),
(287, 'КОНЦЕНТРАТ'),
(76, 'КОРЗИН'),
(340, 'КПП'),
(317, 'КРЕПЛ'),
(406, 'КРМПЛ'),
(476, 'КУРГА'),
(483, 'КУРЬЕР'),
(299, 'ЛАМП'),
(471, 'ЛЮБ'),
(512, 'МАГАЗИН'),
(275, 'МАСЛЯН'),
(531, 'МЕНЕДЖЕР'),
(441, 'МЕТАЛЛ'),
(357, 'МЛ'),
(377, 'МОБ'),
(270, 'МОСТ'),
(10, 'НАИМЕНОВАН'),
(247, 'НАКОНЕЧНИК'),
(470, 'НАМ'),
(502, 'НАМЕЧЕН'),
(495, 'НАПРАВЛЕН'),
(416, 'НЕПРИЯТН'),
(239, 'НИЖ'),
(508, 'НОВ'),
(467, 'НОВОСТ'),
(485, 'ОБРАЗ'),
(424, 'ОКОН'),
(13, 'ОПИСАН'),
(233, 'ОПОР'),
(506, 'ОПРЕДЕЛЕН'),
(489, 'ОРГАНИЗАЦ'),
(352, 'ОСВЕЖИТЕЛ'),
(439, 'ОСТАНОВК'),
(473, 'ОТПРАВ'),
(530, 'ОТПРАВЬТ'),
(456, 'ПВХ'),
(157, 'ПЕР'),
(452, 'ПЕРЧАТК'),
(469, 'ПИШ'),
(503, 'ПЛАНОВ'),
(145, 'ПОВОРОТНИК'),
(498, 'ПОВСЕДНЕВН'),
(367, 'ПОДВЕСН'),
(79, 'ПОДКАТЕГОР'),
(254, 'ПОДУШК'),
(500, 'ПОКАЗЫВА'),
(351, 'ПОЛИУР'),
(312, 'ПОЛИУР-Н'),
(347, 'ПОЛИУРЕТА'),
(77, 'ПОХОЖ'),
(510, 'ПОЧТ'),
(499, 'ПРАКТИК'),
(509, 'ПРЕДЛОЖЕН'),
(490, 'ПРЕДСТАВЛЯ'),
(494, 'ПРОВЕРК'),
(293, 'ПРОВОД'),
(496, 'ПРОГРЕССИВН'),
(516, 'ПРОИЗВОДИТЕЛ'),
(453, 'РАБОЧ'),
(484, 'РАВН'),
(497, 'РАЗВИТ'),
(271, 'РАЗДАТК'),
(501, 'РЕАЛИЗАЦ'),
(101, 'РЕМЕН'),
(258, 'РЕМК-Т'),
(523, 'РЕМОНТ'),
(162, 'РЕССОР'),
(436, 'РОСС'),
(75, 'РУБ'),
(524, 'РУК'),
(248, 'РУЛЕВ'),
(102, 'РУЧЕЙКОВ'),
(481, 'РФ'),
(243, 'РЫЧ'),
(265, 'САЛЬНИК'),
(511, 'САМОВЫВОЗ'),
(321, 'СВЕТ'),
(295, 'СВЕЧ'),
(532, 'СВЯЖЕТ'),
(419, 'СЕРЕБР'),
(285, 'СИН'),
(514, 'СИСТЕМ'),
(517, 'СКИДК'),
(486, 'СЛОЖ'),
(491, 'СОБ'),
(443, 'СООТВ'),
(458, 'СОРТ'),
(527, 'СПЕЦИАЛЬН'),
(168, 'СТАБ'),
(341, 'СТАЛ'),
(487, 'СТРУК-'),
(533, 'СТРУКТУР'),
(260, 'СУППОРТ'),
(261, 'СЦЕПЛЕН'),
(379, 'ТЕЛЕФОН'),
(378, 'ТЕЛЕФОНОВ'),
(427, 'ТЕМН'),
(134, 'ТЕРМОСТАТ'),
(8, 'ТОВАР'),
(289, 'ТОПЛИВН'),
(513, 'ТОРМОЗН'),
(505, 'ТРЕБ'),
(488, 'ТУР'),
(167, 'ТЯГ'),
(477, 'УЛ'),
(376, 'УН'),
(415, 'УСТРАНЯ'),
(373, 'УСТРОЙСТВ'),
(507, 'УТОЧНЕН'),
(274, 'ФИЛЬТР'),
(150, 'ФОНАР'),
(313, 'ЧЕРН'),
(525, 'ЧИТА'),
(234, 'ШАРОВ'),
(382, 'ШНУР'),
(307, 'ШТ'),
(493, 'ЭКСПЕРИМЕНТ'),
(414, 'ЭФФЕКТ'),
(356, 'ЯБЛОК');

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_suggest`
--

CREATE TABLE `b_search_suggest` (
  `ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER_MD5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `RATE` float NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_tags`
--

CREATE TABLE `b_search_tags` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_user_right`
--

CREATE TABLE `b_search_user_right` (
  `USER_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_autolog`
--

CREATE TABLE `b_seo_adv_autolog` (
  `ID` int(11) NOT NULL,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `CAMPAIGN_XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `BANNER_XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CAUSE_CODE` int(11) DEFAULT '0',
  `SUCCESS` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_banner`
--

CREATE TABLE `b_seo_adv_banner` (
  `ID` int(11) NOT NULL,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) DEFAULT NULL,
  `AUTO_QUANTITY_OFF` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `AUTO_QUANTITY_ON` char(1) COLLATE utf8_unicode_ci DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_campaign`
--

CREATE TABLE `b_seo_adv_campaign` (
  `ID` int(11) NOT NULL,
  `ENGINE_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_group`
--

CREATE TABLE `b_seo_adv_group` (
  `ID` int(11) NOT NULL,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `CAMPAIGN_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_link`
--

CREATE TABLE `b_seo_adv_link` (
  `LINK_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `LINK_ID` int(18) NOT NULL,
  `BANNER_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_log`
--

CREATE TABLE `b_seo_adv_log` (
  `ID` int(11) NOT NULL,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `REQUEST_URI` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `REQUEST_DATA` text COLLATE utf8_unicode_ci,
  `RESPONSE_TIME` float NOT NULL,
  `RESPONSE_STATUS` int(5) DEFAULT NULL,
  `RESPONSE_DATA` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_order`
--

CREATE TABLE `b_seo_adv_order` (
  `ID` int(11) NOT NULL,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `ORDER_ID` int(11) NOT NULL,
  `SUM` float DEFAULT '0',
  `PROCESSED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_region`
--

CREATE TABLE `b_seo_adv_region` (
  `ID` int(11) NOT NULL,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `PARENT_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_keywords`
--

CREATE TABLE `b_seo_keywords` (
  `ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_search_engine`
--

CREATE TABLE `b_seo_search_engine` (
  `ID` int(11) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SORT` int(5) DEFAULT '100',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT_SECRET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REDIRECT_URI` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_seo_search_engine`
--

INSERT INTO `b_seo_search_engine` (`ID`, `CODE`, `ACTIVE`, `SORT`, `NAME`, `CLIENT_ID`, `CLIENT_SECRET`, `REDIRECT_URI`, `SETTINGS`) VALUES
(1, 'google', 'Y', 200, 'Google', '868942902147-qrrd6ce1ajfkpse8ieq4gkpdeanvtnno.apps.googleusercontent.com', 'EItMlJpZLC2WRPKB6QsA5bV9', 'urn:ietf:wg:oauth:2.0:oob', NULL),
(2, 'yandex', 'Y', 300, 'Yandex', 'f848c7bfc1d34a94ba6d05439f81bbd7', 'da0e73b2d9cc4e809f3170e49cb9df01', 'https://oauth.yandex.ru/verification_code', NULL),
(3, 'yandex_direct', 'Y', 400, 'Yandex.Direct', '', '', 'https://oauth.yandex.ru/verification_code', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_service_log`
--

CREATE TABLE `b_seo_service_log` (
  `ID` int(11) NOT NULL,
  `DATE_INSERT` datetime NOT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_service_rtg_queue`
--

CREATE TABLE `b_seo_service_rtg_queue` (
  `ID` int(11) NOT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ACCOUNT_ID` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUDIENCE_ID` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `CONTACT_TYPE` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTION` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_AUTO_REMOVE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_sitemap`
--

CREATE TABLE `b_seo_sitemap` (
  `ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_RUN` datetime DEFAULT NULL,
  `SETTINGS` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_sitemap_entity`
--

CREATE TABLE `b_seo_sitemap_entity` (
  `ID` int(11) NOT NULL,
  `ENTITY_TYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `SITEMAP_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_sitemap_iblock`
--

CREATE TABLE `b_seo_sitemap_iblock` (
  `ID` int(11) NOT NULL,
  `IBLOCK_ID` int(11) NOT NULL,
  `SITEMAP_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_sitemap_runtime`
--

CREATE TABLE `b_seo_sitemap_runtime` (
  `ID` int(11) NOT NULL,
  `PID` int(11) NOT NULL,
  `PROCESSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ITEM_PATH` varchar(700) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEM_ID` int(11) DEFAULT NULL,
  `ITEM_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `ACTIVE_ELEMENT` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_yandex_direct_stat`
--

CREATE TABLE `b_seo_yandex_direct_stat` (
  `ID` int(18) NOT NULL,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `DATE_DAY` date NOT NULL,
  `CURRENCY` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUM` float DEFAULT '0',
  `SUM_SEARCH` float DEFAULT '0',
  `SUM_CONTEXT` float DEFAULT '0',
  `CLICKS` int(7) DEFAULT '0',
  `CLICKS_SEARCH` int(7) DEFAULT '0',
  `CLICKS_CONTEXT` int(7) DEFAULT '0',
  `SHOWS` int(7) DEFAULT '0',
  `SHOWS_SEARCH` int(7) DEFAULT '0',
  `SHOWS_CONTEXT` int(7) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_short_uri`
--

CREATE TABLE `b_short_uri` (
  `ID` int(18) NOT NULL,
  `URI` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `URI_CRC` int(18) NOT NULL,
  `SHORT_URI` varbinary(250) NOT NULL,
  `SHORT_URI_CRC` int(18) NOT NULL,
  `STATUS` int(18) NOT NULL DEFAULT '301',
  `MODIFIED` datetime NOT NULL,
  `LAST_USED` datetime DEFAULT NULL,
  `NUMBER_USED` int(18) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_site_template`
--

CREATE TABLE `b_site_template` (
  `ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_site_template`
--

INSERT INTO `b_site_template` (`ID`, `SITE_ID`, `CONDITION`, `SORT`, `TEMPLATE`) VALUES
(1, 's1', '', 1, 'avtomir');

-- --------------------------------------------------------

--
-- Структура таблицы `b_smile`
--

CREATE TABLE `b_smile` (
  `ID` int(18) NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `SET_ID` int(18) NOT NULL DEFAULT '0',
  `SORT` int(10) NOT NULL DEFAULT '150',
  `TYPING` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLICKABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IMAGE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `IMAGE_DEFINITION` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SD',
  `IMAGE_WIDTH` int(11) NOT NULL DEFAULT '0',
  `IMAGE_HEIGHT` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_smile`
--

INSERT INTO `b_smile` (`ID`, `TYPE`, `SET_ID`, `SORT`, `TYPING`, `CLICKABLE`, `HIDDEN`, `IMAGE`, `IMAGE_DEFINITION`, `IMAGE_WIDTH`, `IMAGE_HEIGHT`) VALUES
(1, 'S', 2, 100, ':) :-)', 'Y', 'N', 'bx_smile_smile.png', 'UHD', 20, 20),
(2, 'S', 2, 105, ';) ;-)', 'Y', 'N', 'bx_smile_wink.png', 'UHD', 20, 20),
(3, 'S', 2, 110, ':D :-D', 'Y', 'N', 'bx_smile_biggrin.png', 'UHD', 20, 20),
(4, 'S', 2, 115, '8) 8-)', 'Y', 'N', 'bx_smile_cool.png', 'UHD', 20, 20),
(5, 'S', 2, 120, ':facepalm:', 'Y', 'N', 'bx_smile_facepalm.png', 'UHD', 20, 20),
(6, 'S', 2, 125, ':{} :-{}', 'Y', 'N', 'bx_smile_kiss.png', 'UHD', 20, 20),
(7, 'S', 2, 130, ':( :-(', 'Y', 'N', 'bx_smile_sad.png', 'UHD', 20, 20),
(8, 'S', 2, 135, ':| :-|', 'Y', 'N', 'bx_smile_neutral.png', 'UHD', 20, 20),
(9, 'S', 2, 140, ':oops:', 'Y', 'N', 'bx_smile_redface.png', 'UHD', 20, 20),
(10, 'S', 2, 145, ':cry: :~(', 'Y', 'N', 'bx_smile_cry.png', 'UHD', 20, 20),
(11, 'S', 2, 150, ':evil: >:-<', 'Y', 'N', 'bx_smile_evil.png', 'UHD', 20, 20),
(12, 'S', 2, 155, ':o :-o :shock:', 'Y', 'N', 'bx_smile_eek.png', 'UHD', 20, 20),
(13, 'S', 2, 160, ':/ :-/', 'Y', 'N', 'bx_smile_confuse.png', 'UHD', 20, 20),
(14, 'S', 2, 165, ':idea:', 'Y', 'N', 'bx_smile_idea.png', 'UHD', 20, 20),
(15, 'S', 2, 170, ':?:', 'Y', 'N', 'bx_smile_question.png', 'UHD', 20, 20),
(16, 'S', 2, 175, ':!:', 'Y', 'N', 'bx_smile_exclaim.png', 'UHD', 20, 20),
(17, 'S', 2, 180, ':like:', 'Y', 'N', 'bx_smile_like.png', 'UHD', 20, 20),
(18, 'I', 2, 175, 'ICON_NOTE', 'Y', 'N', 'bx_icon_1.gif', 'SD', 15, 15),
(19, 'I', 2, 180, 'ICON_DIRRECTION', 'Y', 'N', 'bx_icon_2.gif', 'SD', 15, 15),
(20, 'I', 2, 185, 'ICON_IDEA', 'Y', 'N', 'bx_icon_3.gif', 'SD', 15, 15),
(21, 'I', 2, 190, 'ICON_ATTANSION', 'Y', 'N', 'bx_icon_4.gif', 'SD', 15, 15),
(22, 'I', 2, 195, 'ICON_QUESTION', 'Y', 'N', 'bx_icon_5.gif', 'SD', 15, 15),
(23, 'I', 2, 200, 'ICON_BAD', 'Y', 'N', 'bx_icon_6.gif', 'SD', 15, 15),
(24, 'I', 2, 205, 'ICON_GOOD', 'Y', 'N', 'bx_icon_7.gif', 'SD', 15, 15);

-- --------------------------------------------------------

--
-- Структура таблицы `b_smile_lang`
--

CREATE TABLE `b_smile_lang` (
  `ID` int(18) NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `SID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_smile_lang`
--

INSERT INTO `b_smile_lang` (`ID`, `TYPE`, `SID`, `LID`, `NAME`) VALUES
(1, 'P', 1, 'ru', 'Стандартная галерея'),
(2, 'P', 1, 'en', 'Standard gallery'),
(3, 'G', 2, 'ru', 'Основной набор'),
(4, 'G', 2, 'en', 'Default pack'),
(5, 'S', 1, 'ru', 'С улыбкой'),
(6, 'S', 1, 'en', 'Smile'),
(7, 'S', 2, 'ru', 'Шутливо'),
(8, 'S', 2, 'en', 'Wink'),
(9, 'S', 3, 'ru', 'Широкая улыбка'),
(10, 'S', 3, 'en', 'Big grin'),
(11, 'S', 4, 'ru', 'Здорово'),
(12, 'S', 4, 'en', 'Cool'),
(13, 'S', 5, 'ru', 'Разочарование'),
(14, 'S', 5, 'en', 'Facepalm'),
(15, 'S', 6, 'ru', 'Поцелуй'),
(16, 'S', 6, 'en', 'Kiss'),
(17, 'S', 7, 'ru', 'Печально'),
(18, 'S', 7, 'en', 'Sad'),
(19, 'S', 8, 'ru', 'Скептически'),
(20, 'S', 8, 'en', 'Skeptic'),
(21, 'S', 9, 'ru', 'Смущенный'),
(22, 'S', 9, 'en', 'Embarrassed'),
(23, 'S', 10, 'ru', 'Очень грустно'),
(24, 'S', 10, 'en', 'Crying'),
(25, 'S', 11, 'ru', 'Со злостью'),
(26, 'S', 11, 'en', 'Angry'),
(27, 'S', 12, 'ru', 'Удивленно'),
(28, 'S', 12, 'en', 'Surprised'),
(29, 'S', 13, 'ru', 'Смущенно'),
(30, 'S', 13, 'en', 'Confused'),
(31, 'S', 14, 'ru', 'Идея'),
(32, 'S', 14, 'en', 'Idea'),
(33, 'S', 15, 'ru', 'Вопрос'),
(34, 'S', 15, 'en', 'Question'),
(35, 'S', 16, 'ru', 'Восклицание'),
(36, 'S', 16, 'en', 'Exclamation'),
(37, 'S', 17, 'ru', 'Нравится'),
(38, 'S', 17, 'en', 'Like');

-- --------------------------------------------------------

--
-- Структура таблицы `b_smile_set`
--

CREATE TABLE `b_smile_set` (
  `ID` int(18) NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'G',
  `PARENT_ID` int(18) NOT NULL DEFAULT '0',
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(10) NOT NULL DEFAULT '150'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_smile_set`
--

INSERT INTO `b_smile_set` (`ID`, `TYPE`, `PARENT_ID`, `STRING_ID`, `SORT`) VALUES
(1, 'P', 0, 'bitrix', 150),
(2, 'G', 1, 'bitrix_main', 150);

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_ap`
--

CREATE TABLE `b_socialservices_ap` (
  `ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `USER_ID` int(11) NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ENDPOINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  `SETTINGS` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_contact`
--

CREATE TABLE `b_socialservices_contact` (
  `ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `USER_ID` int(11) NOT NULL,
  `CONTACT_USER_ID` int(11) DEFAULT NULL,
  `CONTACT_XML_ID` int(11) DEFAULT NULL,
  `CONTACT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_LAST_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_PHOTO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  `NOTIFY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_contact_connect`
--

CREATE TABLE `b_socialservices_contact_connect` (
  `ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CONTACT_ID` int(11) DEFAULT NULL,
  `LINK_ID` int(11) DEFAULT NULL,
  `CONTACT_PROFILE_ID` int(11) NOT NULL,
  `CONTACT_PORTAL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONNECT_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT 'P',
  `LAST_AUTHORIZE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_message`
--

CREATE TABLE `b_socialservices_message` (
  `ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `SOCSERV_USER_ID` int(11) NOT NULL,
  `PROVIDER` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `SUCCES_SENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_user`
--

CREATE TABLE `b_socialservices_user` (
  `ID` int(11) NOT NULL,
  `LOGIN` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int(11) DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `XML_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `CAN_DELETE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PERSONAL_WWW` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERMISSIONS` varchar(555) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OATOKEN` varchar(3000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OATOKEN_EXPIRES` int(11) DEFAULT NULL,
  `OASECRET` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REFRESH_TOKEN` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEND_ACTIVITY` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SITE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INITIALIZED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_user_link`
--

CREATE TABLE `b_socialservices_user_link` (
  `ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `SOCSERV_USER_ID` int(11) NOT NULL,
  `LINK_USER_ID` int(11) DEFAULT NULL,
  `LINK_UID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LINK_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_LAST_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_PICTURE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sticker`
--

CREATE TABLE `b_sticker` (
  `ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGE_URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PAGE_TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `MODIFIED_BY` int(18) NOT NULL,
  `CREATED_BY` int(18) NOT NULL,
  `PERSONAL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONTENT` text COLLATE utf8_unicode_ci,
  `POS_TOP` int(11) DEFAULT NULL,
  `POS_LEFT` int(11) DEFAULT NULL,
  `WIDTH` int(11) DEFAULT NULL,
  `HEIGHT` int(11) DEFAULT NULL,
  `COLOR` int(11) DEFAULT NULL,
  `COLLAPSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `COMPLETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CLOSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MARKER_TOP` int(11) DEFAULT NULL,
  `MARKER_LEFT` int(11) DEFAULT NULL,
  `MARKER_WIDTH` int(11) DEFAULT NULL,
  `MARKER_HEIGHT` int(11) DEFAULT NULL,
  `MARKER_ADJUST` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sticker_group_task`
--

CREATE TABLE `b_sticker_group_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_task`
--

CREATE TABLE `b_task` (
  `ID` int(18) NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LETTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SYS` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_task`
--

INSERT INTO `b_task` (`ID`, `NAME`, `LETTER`, `MODULE_ID`, `SYS`, `DESCRIPTION`, `BINDING`) VALUES
(1, 'main_denied', 'D', 'main', 'Y', NULL, 'module'),
(2, 'main_change_profile', 'P', 'main', 'Y', NULL, 'module'),
(3, 'main_view_all_settings', 'R', 'main', 'Y', NULL, 'module'),
(4, 'main_view_all_settings_change_profile', 'T', 'main', 'Y', NULL, 'module'),
(5, 'main_edit_subordinate_users', 'V', 'main', 'Y', NULL, 'module'),
(6, 'main_full_access', 'W', 'main', 'Y', NULL, 'module'),
(7, 'fm_folder_access_denied', 'D', 'main', 'Y', NULL, 'file'),
(8, 'fm_folder_access_read', 'R', 'main', 'Y', NULL, 'file'),
(9, 'fm_folder_access_write', 'W', 'main', 'Y', NULL, 'file'),
(10, 'fm_folder_access_full', 'X', 'main', 'Y', NULL, 'file'),
(11, 'fm_folder_access_workflow', 'U', 'main', 'Y', NULL, 'file'),
(12, 'bitrixcloud_deny', 'D', 'bitrixcloud', 'Y', NULL, 'module'),
(13, 'bitrixcloud_control', 'W', 'bitrixcloud', 'Y', NULL, 'module'),
(14, 'clouds_denied', 'D', 'clouds', 'Y', NULL, 'module'),
(15, 'clouds_browse', 'F', 'clouds', 'Y', NULL, 'module'),
(16, 'clouds_upload', 'U', 'clouds', 'Y', NULL, 'module'),
(17, 'clouds_full_access', 'W', 'clouds', 'Y', NULL, 'module'),
(18, 'fileman_denied', 'D', 'fileman', 'Y', '', 'module'),
(19, 'fileman_allowed_folders', 'F', 'fileman', 'Y', '', 'module'),
(20, 'fileman_full_access', 'W', 'fileman', 'Y', '', 'module'),
(21, 'medialib_denied', 'D', 'fileman', 'Y', '', 'medialib'),
(22, 'medialib_view', 'F', 'fileman', 'Y', '', 'medialib'),
(23, 'medialib_only_new', 'R', 'fileman', 'Y', '', 'medialib'),
(24, 'medialib_edit_items', 'V', 'fileman', 'Y', '', 'medialib'),
(25, 'medialib_editor', 'W', 'fileman', 'Y', '', 'medialib'),
(26, 'medialib_full', 'X', 'fileman', 'Y', '', 'medialib'),
(27, 'stickers_denied', 'D', 'fileman', 'Y', '', 'stickers'),
(28, 'stickers_read', 'R', 'fileman', 'Y', '', 'stickers'),
(29, 'stickers_edit', 'W', 'fileman', 'Y', '', 'stickers'),
(30, 'hblock_denied', 'D', 'highloadblock', 'Y', NULL, 'module'),
(31, 'hblock_read', 'R', 'highloadblock', 'Y', NULL, 'module'),
(32, 'hblock_write', 'W', 'highloadblock', 'Y', NULL, 'module'),
(33, 'iblock_deny', 'D', 'iblock', 'Y', NULL, 'iblock'),
(34, 'iblock_read', 'R', 'iblock', 'Y', NULL, 'iblock'),
(35, 'iblock_element_add', 'E', 'iblock', 'Y', NULL, 'iblock'),
(36, 'iblock_admin_read', 'S', 'iblock', 'Y', NULL, 'iblock'),
(37, 'iblock_admin_add', 'T', 'iblock', 'Y', NULL, 'iblock'),
(38, 'iblock_limited_edit', 'U', 'iblock', 'Y', NULL, 'iblock'),
(39, 'iblock_full_edit', 'W', 'iblock', 'Y', NULL, 'iblock'),
(40, 'iblock_full', 'X', 'iblock', 'Y', NULL, 'iblock'),
(41, 'seo_denied', 'D', 'seo', 'Y', '', 'module'),
(42, 'seo_edit', 'F', 'seo', 'Y', '', 'module'),
(43, 'seo_full_access', 'W', 'seo', 'Y', '', 'module');

-- --------------------------------------------------------

--
-- Структура таблицы `b_task_operation`
--

CREATE TABLE `b_task_operation` (
  `TASK_ID` int(18) NOT NULL,
  `OPERATION_ID` int(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_task_operation`
--

INSERT INTO `b_task_operation` (`TASK_ID`, `OPERATION_ID`) VALUES
(2, 2),
(2, 3),
(3, 2),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(5, 2),
(5, 3),
(5, 5),
(5, 6),
(5, 7),
(5, 8),
(5, 9),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 10),
(6, 11),
(6, 12),
(6, 13),
(6, 14),
(6, 15),
(6, 16),
(6, 17),
(6, 18),
(8, 19),
(8, 20),
(8, 21),
(9, 19),
(9, 20),
(9, 21),
(9, 22),
(9, 23),
(9, 24),
(9, 25),
(9, 26),
(9, 27),
(9, 28),
(9, 29),
(9, 30),
(9, 31),
(9, 32),
(9, 33),
(9, 34),
(10, 19),
(10, 20),
(10, 21),
(10, 22),
(10, 23),
(10, 24),
(10, 25),
(10, 26),
(10, 27),
(10, 28),
(10, 29),
(10, 30),
(10, 31),
(10, 32),
(10, 33),
(10, 34),
(10, 35),
(11, 19),
(11, 20),
(11, 21),
(11, 24),
(11, 28),
(13, 36),
(13, 37),
(13, 38),
(15, 39),
(16, 39),
(16, 40),
(17, 39),
(17, 40),
(17, 41),
(19, 44),
(19, 45),
(19, 46),
(19, 47),
(19, 48),
(19, 49),
(19, 50),
(19, 52),
(19, 53),
(20, 42),
(20, 43),
(20, 44),
(20, 45),
(20, 46),
(20, 47),
(20, 48),
(20, 49),
(20, 50),
(20, 51),
(20, 52),
(20, 53),
(20, 54),
(22, 55),
(23, 55),
(23, 56),
(23, 60),
(24, 55),
(24, 60),
(24, 61),
(24, 62),
(25, 55),
(25, 56),
(25, 57),
(25, 58),
(25, 60),
(25, 61),
(25, 62),
(26, 55),
(26, 56),
(26, 57),
(26, 58),
(26, 59),
(26, 60),
(26, 61),
(26, 62),
(28, 63),
(29, 63),
(29, 64),
(29, 65),
(29, 66),
(31, 67),
(32, 68),
(32, 69),
(34, 70),
(34, 71),
(35, 72),
(36, 70),
(36, 71),
(36, 73),
(37, 70),
(37, 71),
(37, 72),
(37, 73),
(38, 70),
(38, 71),
(38, 72),
(38, 73),
(38, 74),
(38, 75),
(38, 76),
(38, 77),
(39, 70),
(39, 71),
(39, 72),
(39, 73),
(39, 74),
(39, 75),
(39, 76),
(39, 77),
(39, 78),
(39, 79),
(39, 80),
(39, 81),
(40, 70),
(40, 71),
(40, 72),
(40, 73),
(40, 74),
(40, 75),
(40, 76),
(40, 77),
(40, 78),
(40, 79),
(40, 80),
(40, 81),
(40, 82),
(40, 83),
(40, 84),
(40, 85),
(40, 86),
(40, 87),
(42, 89),
(43, 88),
(43, 89);

-- --------------------------------------------------------

--
-- Структура таблицы `b_undo`
--

CREATE TABLE `b_undo` (
  `ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_HANDLER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` mediumtext COLLATE utf8_unicode_ci,
  `USER_ID` int(11) DEFAULT NULL,
  `TIMESTAMP_X` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_undo`
--

INSERT INTO `b_undo` (`ID`, `MODULE_ID`, `UNDO_TYPE`, `UNDO_HANDLER`, `CONTENT`, `USER_ID`, `TIMESTAMP_X`) VALUES
('101599b23c2072319544a2dd6fc780a06', 'fileman', 'new_section', 'CFileman::UndoNewSection', 'a:4:{s:7:\"absPath\";s:43:\"D:/OpenServer/domains/avtomir45.ru/dostavka\";s:4:\"path\";s:9:\"/dostavka\";s:4:\"site\";s:2:\"s1\";s:4:\"menu\";a:3:{s:8:\"menuFile\";s:15:\"/.left.menu.php\";s:8:\"menuName\";s:16:\"Доставка\";s:8:\"menuPath\";s:10:\"/dostavka/\";}}', 1, 1503849637),
('110cf5cd5809632c64a3da440a8c2237b', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:49:\"D:/OpenServer/domains/avtomir45.ru/news/index.php\";s:7:\"content\";s:177:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости\");\n?>Text here....<?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1503848277),
('128861181c9bb4c9c5e6e3b9aa710c685', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:49:\"D:/OpenServer/domains/avtomir45.ru/news/index.php\";s:7:\"content\";s:1656:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.detail\",\n	\"\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_ELEMENT_CHAIN\" => \"N\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"N\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"ELEMENT_CODE\" => \"\",\n		\"ELEMENT_ID\" => $_REQUEST[\"ELEMENT_ID\"],\n		\"FIELD_CODE\" => array(\"\",\"\"),\n		\"IBLOCK_ID\" => \"\",\n		\"IBLOCK_TYPE\" => \"news\",\n		\"IBLOCK_URL\" => \"\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Страница\",\n		\"PROPERTY_CODE\" => array(\"\",\"\"),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_CANONICAL_URL\" => \"N\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_SHARE\" => \"N\"\n	)\n);?><br>\n<?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"\",\nArray(),\nfalse\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1503848357),
('1308a99b38d767393857f502388181da4', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:70:\"D:/OpenServer/domains/avtomir45.ru/bitrix/templates/avtomir/header.php\";s:7:\"content\";s:6661:\"<?if(!defined(\"B_PROLOG_INCLUDED\") || B_PROLOG_INCLUDED!==true)die();\nIncludeTemplateLangFile(__FILE__); ?>\n<!DOCTYPE html>\n<html lang=\"<?echo GetMessage(\"language\");?>\">\n<head>\n    <meta http-equiv=\"content-type\" content=\"text/html; charset=<?echo LANG_CHARSET?>\" />\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <?$APPLICATION->SetAdditionalCSS(SITE_TEMPLATE_PATH . \'/slick/slick.css\');?>\n    <?$APPLICATION->SetAdditionalCSS(SITE_TEMPLATE_PATH . \'/slick/slick-theme.css\');?>\n    <?$APPLICATION->SetAdditionalCSS(SITE_TEMPLATE_PATH . \'/template_styles.css\');?>\n    <?$APPLICATION->AddHeadScript(SITE_TEMPLATE_PATH . \'/js/jquery-3.2.1.min.js\');?>\n    <?$APPLICATION->AddHeadScript(SITE_TEMPLATE_PATH . \'/slick/slick.min.js\');?>\n    <?$APPLICATION->AddHeadScript(SITE_TEMPLATE_PATH . \'/js/script.js\');?>\n    <?$APPLICATION->ShowHead();?>\n    <?$APPLICATION->ShowMeta(\"keywords\");?>\n    <?$APPLICATION->ShowMeta(\"description\");?>\n    <title><?$APPLICATION->ShowTitle()?></title>\n\n    <link rel=\"apple-touch-icon\" sizes=\"57x57\" href=\"<? echo SITE_TEMPLATE_PATH;?>/images/favicon/apple-icon-57x57.png\">\n    <link rel=\"apple-touch-icon\" sizes=\"60x60\" href=\"<? echo SITE_TEMPLATE_PATH;?>/images/favicon/apple-icon-60x60.png\">\n    <link rel=\"apple-touch-icon\" sizes=\"72x72\" href=\"<? echo SITE_TEMPLATE_PATH;?>/images/favicon/apple-icon-72x72.png\">\n    <link rel=\"apple-touch-icon\" sizes=\"76x76\" href=\"<? echo SITE_TEMPLATE_PATH;?>/images/favicon/apple-icon-76x76.png\">\n    <link rel=\"apple-touch-icon\" sizes=\"114x114\" href=\"<? echo SITE_TEMPLATE_PATH;?>/images/favicon/apple-icon-114x114.png\">\n    <link rel=\"apple-touch-icon\" sizes=\"120x120\" href=\"<? echo SITE_TEMPLATE_PATH;?>/images/favicon/apple-icon-120x120.png\">\n    <link rel=\"apple-touch-icon\" sizes=\"144x144\" href=\"<? echo SITE_TEMPLATE_PATH;?>/images/favicon/apple-icon-144x144.png\">\n    <link rel=\"apple-touch-icon\" sizes=\"152x152\" href=\"<? echo SITE_TEMPLATE_PATH;?>/images/favicon/apple-icon-152x152.png\">\n    <link rel=\"apple-touch-icon\" sizes=\"180x180\" href=\"<? echo SITE_TEMPLATE_PATH;?>/images/favicon/apple-icon-180x180.png\">\n    <link rel=\"icon\" type=\"image/png\" sizes=\"192x192\"  href=\"<? echo SITE_TEMPLATE_PATH;?>/images/favicon/android-icon-192x192.png\">\n    <link rel=\"icon\" type=\"image/png\" sizes=\"32x32\" href=\"<? echo SITE_TEMPLATE_PATH;?>/images/favicon/favicon-32x32.png\">\n    <link rel=\"icon\" type=\"image/png\" sizes=\"96x96\" href=\"<? echo SITE_TEMPLATE_PATH;?>/images/favicon/favicon-96x96.png\">\n    <link rel=\"icon\" type=\"image/png\" sizes=\"16x16\" href=\"<? echo SITE_TEMPLATE_PATH;?>/images/favicon/favicon-16x16.png\">\n    <link rel=\"manifest\" href=\"<? echo SITE_TEMPLATE_PATH;?>/images/favicon/manifest.json\">\n    <meta name=\"msapplication-TileColor\" content=\"#ffffff\">\n    <meta name=\"msapplication-TileImage\" content=\"<? echo SITE_TEMPLATE_PATH;?>/images/favicon/ms-icon-144x144.png\">\n    <meta name=\"theme-color\" content=\"#ffffff\">\n</head>\n<body>\n\n<?$APPLICATION->ShowPanel()?>\n    <header>\n        <div class=\"moble-menu-top\">\n            <div class=\"header-logo-moble\">\n                <a href=\"/\">\n                    <img src=\"<? echo SITE_TEMPLATE_PATH;?>/images/logo.png\" alt=\"\">\n                </a>\n            </div>\n            <span class=\"tog\"></span>\n        </div>\n        <div class=\"moble-menu\">\n            <div class=\"header-top\">\n                <div class=\"header-top-item\">\n                    <div class=\"header-logo\">\n                        <a href=\"/\">\n                            <img src=\"<? echo SITE_TEMPLATE_PATH;?>/images/logo.png\" alt=\"\">\n                        </a>\n                    </div>\n                    <div class=\"header-contacts\">\n                        <p class=\"header-tell\">+7 (3522) 63-00-68</p>\n                        <p class=\"header-city\">Курган</p>\n                    </div>\n                </div>\n                <?$APPLICATION->IncludeComponent(\n                    \"bitrix:menu\",\n                    \"\",\n                    Array(\n                        \"ALLOW_MULTI_SELECT\" => \"N\",\n                        \"CHILD_MENU_TYPE\" => \"left\",\n                        \"DELAY\" => \"N\",\n                        \"MAX_LEVEL\" => \"1\",\n                        \"MENU_CACHE_GET_VARS\" => array(\"\"),\n                        \"MENU_CACHE_TIME\" => \"3600\",\n                        \"MENU_CACHE_TYPE\" => \"A\",\n                        \"MENU_CACHE_USE_GROUPS\" => \"Y\",\n                        \"ROOT_MENU_TYPE\" => \"left\",\n                        \"USE_EXT\" => \"N\"\n                    )\n                );?>\n            </div>\n            <div class=\"header-bottom\">\n                <div class=\"header-bottom-item\">\n                    <div class=\"header-bottom-list\">\n                        <div id=\"button\">\n                            <p class=\"menu_class\">Каталог</p>\n                            <ul class=\"the_menu\">\n                                <li><a href=\"#\">Каталог</a></li>\n                                <li><a href=\"#\">Каталог</a></li>\n                                <li><a href=\"#\">Каталог</a></li>\n                                <li><a href=\"#\">Каталог</a></li>\n                                <li><a href=\"#\">Каталог</a></li>\n                                <li><a href=\"#\">Каталог</a></li>\n                                <li><a href=\"#\">Каталог</a></li>\n                                <li><a href=\"#\">Каталог</a></li>\n                            </ul>\n                        </div>\n                    </div>\n                    <div class=\"header-bottom-search\">\n                        <form action=\"/search.php\" method=\"get\">\n                            <input type=\"text\" name=\"q\" class=\"search-item search-item--code\" placeholder=\"Поиск по артикулу\">\n                        </form>\n                    </div>\n                    <div class=\"header-bottom-search header-bottom-search-min\">\n                        <form>\n                            <input type=\"text\" class=\"search-item search-item--vin\" placeholder=\"Поиск VIN\">\n                        </form>\n                    </div>\n                </div>\n                <div class=\"header-bottom-buttons\">\n                    <div class=\"entry\">\n                        <a href=\"\" class=\"btn btn-entry\">Вход</a>\n                        <a href=\"\" class=\"btn btn-registration\">Регистрация</a>\n                    </div>\n                    <a href=\"\" class=\"btn btn-basket\">Корзина<span>0</span></a>\n                </div>\n            </div>\n        </div>\n    </header>\";}', 1, 1503850548),
('16ab7607df5effc8d3e83c25782f7a258', 'fileman', 'new_section', 'CFileman::UndoNewSection', 'a:4:{s:7:\"absPath\";s:43:\"D:/OpenServer/domains/avtomir45.ru/kontakty\";s:4:\"path\";s:9:\"/kontakty\";s:4:\"site\";s:2:\"s1\";s:4:\"menu\";a:3:{s:8:\"menuFile\";s:14:\"/.top.menu.php\";s:8:\"menuName\";s:16:\"Контакты\";s:8:\"menuPath\";s:10:\"/kontakty/\";}}', 1, 1503848494),
('16f6b6d58fe45b5f41b3128df2651c9a2', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:112:\"D:/OpenServer/domains/avtomir45.ru/bitrix/templates/avtomir/components/bitrix/breadcrumb/breadcrumb/template.php\";s:7:\"content\";s:1610:\"<?php\nif(!defined(\"B_PROLOG_INCLUDED\") || B_PROLOG_INCLUDED!==true)die();\n\n/**\n * @global CMain $APPLICATION\n */\n\nglobal $APPLICATION;\n\n//delayed function must return a string\nif(empty($arResult))\n	return \"\";\n\n$strReturn = \'\';\n\n//we can\'t use $APPLICATION->SetAdditionalCSS() here because we are inside the buffered function GetNavChain()\n$css = $APPLICATION->GetCSSArray();\nif(!is_array($css) || !in_array(\"/bitrix/css/main/font-awesome.css\", $css))\n{\n	$strReturn .= \'<link href=\"\'.CUtil::GetAdditionalFileURL(\"/bitrix/css/main/font-awesome.css\").\'\" type=\"text/css\" rel=\"stylesheet\" />\'.\"\\n\";\n}\n\n$strReturn .= \'<div class=\"bx-breadcrumb\">\';\n\n$itemSize = count($arResult);\nfor($index = 0; $index < $itemSize; $index++)\n{\n	$title = htmlspecialcharsex($arResult[$index][\"TITLE\"]);\n\n	$nextRef = ($index < $itemSize-2 && $arResult[$index+1][\"LINK\"] <> \"\"? \' itemref=\"bx_breadcrumb_\'.($index+1).\'\"\' : \'\');\n	$child = ($index > 0? \' itemprop=\"child\"\' : \'\');\n	$arrow = ($index > 0? \'<i class=\"fa fa-angle-right\"></i>\' : \'\');\n\n	if($arResult[$index][\"LINK\"] <> \"\" && $index != $itemSize-1)\n	{\n		$strReturn .= \'\n			<div class=\"bx-breadcrumb-item\" id=\"bx_breadcrumb_\'.$index.\'\" itemscope=\"\" itemtype=\"http://data-vocabulary.org/Breadcrumb\"\'.$child.$nextRef.\'>\n				\'.$arrow.\'\n				<a href=\"\'.$arResult[$index][\"LINK\"].\'\" title=\"\'.$title.\'\" itemprop=\"url\">\n					<span itemprop=\"title\">\'.$title.\'</span>\n				</a>\n			</div>\';\n	}\n	else\n	{\n		$strReturn .= \'\n			<div class=\"bx-breadcrumb-item\">\n				\'.$arrow.\'\n				<span>\'.$title.\'</span>\n			</div>\';\n	}\n}\n\n$strReturn .= \'<div style=\"clear:both\"></div></div>\';\n\nreturn $strReturn;\n\";}', 1, 1503849081),
('17e2298f6eede82296b9f487e1ff281ea', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:53:\"D:/OpenServer/domains/avtomir45.ru/kontakty/index.php\";s:7:\"content\";s:2153:\"<?php require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Контакты\");\n?>\n\n<main>\n    <div class=\"breadcrumbs\">\n    <div class=\"content-container\">\n        <ul>\n            <li>\n                <a href=\"index.html\"><span>Главная</span></a>\n            </li>\n            <li>\n                <a class=\"breadcrumbs-active\" href=\"\"><span>Контакты</span></a>\n            </li>\n        </ul>\n    </div>\n    </div>\n    <div class=\"container\">\n        <div class=\"contacts-wr\">\n            <div class=\"contacts-form\">\n                <form method=\"post\">\n                    <fieldset>\n                        <legend>Пишите нам по любому вопросу</legend>\n                        <div class=\"contacts-box\">\n                            <input type=\"text\" placeholder=\"Ваше имя\">\n                            <input type=\"text\" placeholder=\"Телефон или e-mail\">\n                        </div>\n                        <div class=\"textarea\">\n                            <textarea name=\"text\" id=\"text\" placeholder=\"Дополнительный коментарий\" rows=\"6\"></textarea>\n                        </div>\n                    </fieldset>\n                    <button type=\"submit\" class=\"btn btn-submit\">Отправить</button>\n                </form>\n            </div>\n            <div class=\"contacts-info\">\n                <div class=\"contacts\">\n                    <p class=\"tell\">+7 (3522) 63-00-68</p>\n                    <p class=\"city\">Курган, ул. Дзержинского, 68</p>\n                    <p class=\"web\"><a href=\"http://автомир45.рф\">www.автомир45.рф</a></p>\n                </div>\n            </div>\n        </div>\n    </div>\n    <div class=\"map\">\n        <script type=\"text/javascript\" charset=\"utf-8\" async src=\"https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3A69df94a81536e2d88bef0986762c740d2baf36e023cfa89b8b68c4e5c3d2e192&amp;width=100%25&amp;height=443&amp;lang=ru_RU&amp;scroll=true\"></script>\n    </div>\n</main>\n\n<?php require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1503848945),
('185ffd8482ba8175af9e788e28da29f84', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:49:\"D:/OpenServer/domains/avtomir45.ru/news/index.php\";s:7:\"content\";s:1757:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.detail\", \n	\".default\", \n	array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_ELEMENT_CHAIN\" => \"N\",\n		\"ADD_SECTIONS_CHAIN\" => \"N\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"N\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"N\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"ELEMENT_CODE\" => \"\",\n		\"ELEMENT_ID\" => $_REQUEST[\"ELEMENT_ID\"],\n		\"FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"IBLOCK_ID\" => \"2\",\n		\"IBLOCK_TYPE\" => \"news\",\n		\"IBLOCK_URL\" => \"\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Страница\",\n		\"PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"SET_BROWSER_TITLE\" => \"N\",\n		\"SET_CANONICAL_URL\" => \"N\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"N\",\n		\"SET_META_KEYWORDS\" => \"N\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"N\",\n		\"SHOW_404\" => \"N\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\"\n	),\n	false\n);?><br>\n<?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"\",\nArray(),\nfalse\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1503848452),
('18f683c9699afc16545c136f6ed05023f', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:53:\"D:/OpenServer/domains/avtomir45.ru/kontakty/index.php\";s:7:\"content\";s:2015:\"<?php require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Контакты\");\n?>\n\n<main>\n    <?$APPLICATION->IncludeComponent(\n    \"bitrix:breadcrumb\",\n    \"\",\n    Array()\n    );?>\n    <div class=\"container\">\n        <div class=\"contacts-wr\">\n            <div class=\"contacts-form\">\n                <form method=\"post\">\n                    <fieldset>\n                        <legend>Пишите нам по любому вопросу</legend>\n                        <div class=\"contacts-box\">\n                            <input type=\"text\" placeholder=\"Ваше имя\"> <input type=\"text\" placeholder=\"Телефон или e-mail\">\n                        </div>\n                        <div class=\"textarea\">\n                            <textarea name=\"text\" id=\"text\" placeholder=\"Дополнительный коментарий\" rows=\"6\"></textarea>\n                        </div>\n                    </fieldset>\n                    <button type=\"submit\" class=\"btn btn-submit\">Отправить</button>\n                </form>\n            </div>\n            <div class=\"contacts-info\">\n                <div class=\"contacts\">\n                    <p class=\"tell\">\n                         +7 (3522) 63-00-68\n                    </p>\n                    <p class=\"city\">\n                         Курган, ул. Дзержинского, 68\n                    </p>\n                    <p class=\"web\">\n                        <a href=\"http://автомир45.рф\">www.автомир45.рф</a>\n                    </p>\n                </div>\n            </div>\n        </div>\n    </div>\n    <div class=\"map\">\n         <script type=\"text/javascript\" charset=\"utf-8\" async src=\"https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3A69df94a81536e2d88bef0986762c740d2baf36e023cfa89b8b68c4e5c3d2e192&amp;width=100%25&amp;height=443&amp;lang=ru_RU&amp;scroll=true\"></script>\n    </div>\n</main>\n<?php require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1503849057),
('193a3e551f46cdb5e49e0f80ff48ff7b0', 'fileman', 'new_section', 'CFileman::UndoNewSection', 'a:4:{s:7:\"absPath\";s:38:\"D:/OpenServer/domains/avtomir45.ru/vin\";s:4:\"path\";s:4:\"/vin\";s:4:\"site\";s:2:\"s1\";s:4:\"menu\";a:3:{s:8:\"menuFile\";s:15:\"/.left.menu.php\";s:8:\"menuName\";s:21:\"Запрос по VIN\";s:8:\"menuPath\";s:5:\"/vin/\";}}', 1, 1503851621),
('1f39735e8830b5d757334ef2ca68c9518', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:107:\"D:/OpenServer/domains/avtomir45.ru/bitrix/templates/avtomir/components/bitrix/menu/menu_header/template.php\";s:7:\"content\";s:494:\"<?if (!defined(\"B_PROLOG_INCLUDED\") || B_PROLOG_INCLUDED!==true)die();?>\r\n\r\n<?if (!empty($arResult)):?>\r\n<ul class=\"left-menu\">\r\n\r\n<?\r\nforeach($arResult as $arItem):\r\n	if($arParams[\"MAX_LEVEL\"] == 1 && $arItem[\"DEPTH_LEVEL\"] > 1) \r\n		continue;\r\n?>\r\n	<?if($arItem[\"SELECTED\"]):?>\r\n		<li><a href=\"<?=$arItem[\"LINK\"]?>\" class=\"selected\"><?=$arItem[\"TEXT\"]?></a></li>\r\n	<?else:?>\r\n		<li><a href=\"<?=$arItem[\"LINK\"]?>\"><?=$arItem[\"TEXT\"]?></a></li>\r\n	<?endif?>\r\n	\r\n<?endforeach?>\r\n\r\n</ul>\r\n<?endif?>\";}', 1, 1503850570),
('1f7a00cffb54f8ddc2d9f568f04472f12', 'fileman', 'new_section', 'CFileman::UndoNewSection', 'a:4:{s:7:\"absPath\";s:39:\"D:/OpenServer/domains/avtomir45.ru/news\";s:4:\"path\";s:5:\"/news\";s:4:\"site\";s:2:\"s1\";s:4:\"menu\";a:3:{s:8:\"menuFile\";s:14:\"/.top.menu.php\";s:8:\"menuName\";s:14:\"Новости\";s:8:\"menuPath\";s:6:\"/news/\";}}', 1, 1503848073),
('1fe96fae6ce107bc877f486f5e24f2ff7', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:44:\"D:/OpenServer/domains/avtomir45.ru/index.php\";s:7:\"content\";s:6291:\"<?php require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"АВТОМИР45\");\n?>\n\n<main>\n    <div class=\"container\">\n        <div class=\"assortment\">\n            <div class=\"assortment-item\">\n                <a href=\"/katalog/\">\n                    <img src=\"<? echo SITE_TEMPLATE_PATH;?>/images/assortment-1.png\" alt=\"\">\n                </a>\n            </div>\n            <div class=\"assortment-item\">\n                <a href=\"\">\n                    <img src=\"<? echo SITE_TEMPLATE_PATH;?>/images/assortment-2.png\" alt=\"\">\n                </a>\n            </div>\n            <div class=\"assortment-item\">\n                <a href=\"\">\n                    <img src=\"<? echo SITE_TEMPLATE_PATH;?>/images/assortment-3.png\" alt=\"\">\n                </a>\n            </div>\n            <div class=\"assortment-item\">\n                <a href=\"\">\n                    <img src=\"<? echo SITE_TEMPLATE_PATH;?>/images/assortment-4.png\" alt=\"\">\n                </a>\n            </div>\n        </div>\n    </div>\n    <div class=\"slick-slider\">\n        <div><img src=\"<? echo SITE_TEMPLATE_PATH;?>/images/slide1.jpg\" alt=\"\">\n            <h3 class=\"slider-text1\">Тормозные системы от ведущего производителя</h3>\n            <p class=\"slider-text2\">скидка <span>10%<sup>*</sup></span></p>\n        </div>\n        <div><img src=\"<? echo SITE_TEMPLATE_PATH;?>/images/slide1.jpg\" alt=\"\">\n            <h3 class=\"slider-text1\">Тормозные системы от ведущего производителя</h3>\n            <p class=\"slider-text2\">скидка <span>11%<sup>*</sup></span></p>\n        </div>\n        <div><img src=\"<? echo SITE_TEMPLATE_PATH;?>/images/slide1.jpg\" alt=\"\">\n            <h3 class=\"slider-text1\">Тормозные системы от ведущего производителя</h3>\n            <p class=\"slider-text2\">скидка <span>12%<sup>*</sup></span></p>\n        </div>\n        <div><img src=\"<? echo SITE_TEMPLATE_PATH;?>/images/slide1.jpg\" alt=\"\">\n            <h3 class=\"slider-text1\">Тормозные системы от ведущего производителя</h3>\n            <p class=\"slider-text2\">скидка <span>13%<sup>*</sup></span></p>\n        </div>\n        <div><img src=\"<? echo SITE_TEMPLATE_PATH;?>/images/slide1.jpg\" alt=\"\">\n            <h3 class=\"slider-text1\">Тормозные системы от ведущего производителя</h3>\n            <p class=\"slider-text2\">скидка <span>14%<sup>*</sup></span></p>\n        </div>\n        <div><img src=\"<? echo SITE_TEMPLATE_PATH;?>/images/slide1.jpg\" alt=\"\">\n            <h3 class=\"slider-text1\">Тормозные системы от ведущего производителя</h3>\n            <p class=\"slider-text2\">скидка <span>15%<sup>*</sup></span></p>\n        </div>\n    </div>\n    <div class=\"container\">\n        <section class=\"news\">\n            <h4>Новости</h4>\n            <div class=\"news-wr\">\n                <article class=\"news-item\">\n                    <div class=\"news-img\">\n                        <img src=\"<? echo SITE_TEMPLATE_PATH;?>/images/news1.png\" alt=\"\">\n                    </div>\n                    <div class=\"news-text\">\n                        <h5>Ремонт своими руками</h5>\n                        <p>Равным образом сложившаяся струк- тура организации представляет собой интересный эксперимент проверки направлений прогрессивного развития. Повседневная практика показывает, что реализация намеченных плановых заданий требуют определения и уточнения новых предложений.</p>\n                        <a href=\"\" class=\"news-link\">Читать далее...</a>\n                    </div>\n                </article>\n                <article class=\"news-item\">\n                    <div class=\"news-text\">\n                        <h5>Ремонт своими руками</h5>\n                        <p>Равным образом сложившаяся струк- тура организации представляет собой интересный эксперимент проверки направлений прогрессивного развития. Повседневная практика показывает, что реализация намеченных плановых заданий требуют определения и уточнения новых предложений.</p>\n                        <a href=\"\" class=\"news-link\">Читать далее...</a>\n                    </div>\n                </article>\n                <article class=\"news-item\">\n                    <div class=\"news-text\">\n                        <h5>Ремонт своими руками</h5>\n                        <p>Равным образом сложившаяся струк- тура организации представляет собой интересный эксперимент проверки направлений прогрессивного развития. Повседневная практика показывает, что реализация намеченных плановых заданий требуют определения и уточнения новых предложений.</p>\n                        <a href=\"\" class=\"news-link\">Читать далее...</a>\n                    </div>\n                </article>\n            </div>\n        </section>\n        <section class=\"special-offers\">\n            <h4>Специальные предложения</h4>\n            <div class=\"special-wr\">\n                <div class=\"special-offers-item\">\n                    <img src=\"<? echo SITE_TEMPLATE_PATH;?>/images/special1.png\" alt=\"\">\n                </div>\n                <div class=\"special-offers-item\">\n                    <img src=\"<? echo SITE_TEMPLATE_PATH;?>/images/special2.png\" alt=\"\">\n                </div>\n            </div>\n        </section>\n    </div>\n</main>\n\n<?php require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1503850048);

-- --------------------------------------------------------

--
-- Структура таблицы `b_urlpreview_metadata`
--

CREATE TABLE `b_urlpreview_metadata` (
  `ID` int(11) NOT NULL,
  `URL` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `DATE_INSERT` datetime NOT NULL,
  `DATE_EXPIRE` datetime DEFAULT NULL,
  `TITLE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `IMAGE_ID` int(11) DEFAULT NULL,
  `IMAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMBED` mediumtext COLLATE utf8_unicode_ci,
  `EXTRA` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_urlpreview_route`
--

CREATE TABLE `b_urlpreview_route` (
  `ID` int(11) NOT NULL,
  `ROUTE` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMETERS` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user`
--

CREATE TABLE `b_user` (
  `ID` int(18) NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `LOGIN` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CHECKWORD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_LOGIN` datetime DEFAULT NULL,
  `DATE_REGISTER` datetime NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PROFESSION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ICQ` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_GENDER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int(18) DEFAULT NULL,
  `PERSONAL_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_MOBILE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STREET` text COLLATE utf8_unicode_ci,
  `PERSONAL_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_NOTES` text COLLATE utf8_unicode_ci,
  `WORK_COMPANY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_DEPARTMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_POSITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STREET` text COLLATE utf8_unicode_ci,
  `WORK_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PROFILE` text COLLATE utf8_unicode_ci,
  `WORK_LOGO` int(18) DEFAULT NULL,
  `WORK_NOTES` text COLLATE utf8_unicode_ci,
  `ADMIN_NOTES` text COLLATE utf8_unicode_ci,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDAY` date DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CHECKWORD_TIME` datetime DEFAULT NULL,
  `SECOND_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONFIRM_CODE` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN_ATTEMPTS` int(18) DEFAULT NULL,
  `LAST_ACTIVITY_DATE` datetime DEFAULT NULL,
  `AUTO_TIME_ZONE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIME_ZONE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIME_ZONE_OFFSET` int(18) DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BX_USER_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_user`
--

INSERT INTO `b_user` (`ID`, `TIMESTAMP_X`, `LOGIN`, `PASSWORD`, `CHECKWORD`, `ACTIVE`, `NAME`, `LAST_NAME`, `EMAIL`, `LAST_LOGIN`, `DATE_REGISTER`, `LID`, `PERSONAL_PROFESSION`, `PERSONAL_WWW`, `PERSONAL_ICQ`, `PERSONAL_GENDER`, `PERSONAL_BIRTHDATE`, `PERSONAL_PHOTO`, `PERSONAL_PHONE`, `PERSONAL_FAX`, `PERSONAL_MOBILE`, `PERSONAL_PAGER`, `PERSONAL_STREET`, `PERSONAL_MAILBOX`, `PERSONAL_CITY`, `PERSONAL_STATE`, `PERSONAL_ZIP`, `PERSONAL_COUNTRY`, `PERSONAL_NOTES`, `WORK_COMPANY`, `WORK_DEPARTMENT`, `WORK_POSITION`, `WORK_WWW`, `WORK_PHONE`, `WORK_FAX`, `WORK_PAGER`, `WORK_STREET`, `WORK_MAILBOX`, `WORK_CITY`, `WORK_STATE`, `WORK_ZIP`, `WORK_COUNTRY`, `WORK_PROFILE`, `WORK_LOGO`, `WORK_NOTES`, `ADMIN_NOTES`, `STORED_HASH`, `XML_ID`, `PERSONAL_BIRTHDAY`, `EXTERNAL_AUTH_ID`, `CHECKWORD_TIME`, `SECOND_NAME`, `CONFIRM_CODE`, `LOGIN_ATTEMPTS`, `LAST_ACTIVITY_DATE`, `AUTO_TIME_ZONE`, `TIME_ZONE`, `TIME_ZONE_OFFSET`, `TITLE`, `BX_USER_ID`, `LANGUAGE_ID`) VALUES
(1, NULL, 'admin_avto45', '1z6PY96eed89c3ca5a5d72aeafcc0fdbfc791125', 'VsvJnf8i9b8c879a30f699c13cbc2c3e00fd2e26', 'Y', '', '', 'prog3@insideonline.ru', '2017-08-27 20:23:00', '2017-08-16 21:21:23', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-16 21:21:23', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_access`
--

CREATE TABLE `b_user_access` (
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCESS_CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_user_access`
--

INSERT INTO `b_user_access` (`USER_ID`, `PROVIDER_ID`, `ACCESS_CODE`) VALUES
(0, 'group', 'G2'),
(1, 'group', 'G1'),
(1, 'group', 'G3'),
(1, 'group', 'G4'),
(1, 'group', 'G2'),
(1, 'user', 'U1');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_access_check`
--

CREATE TABLE `b_user_access_check` (
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_user_access_check`
--

INSERT INTO `b_user_access_check` (`USER_ID`, `PROVIDER_ID`) VALUES
(1, 'group'),
(1, 'user');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_counter`
--

CREATE TABLE `b_user_counter` (
  `USER_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '**',
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CNT` int(18) NOT NULL DEFAULT '0',
  `LAST_DATE` datetime DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '3000-01-01 00:00:00',
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci,
  `SENT` char(1) COLLATE utf8_unicode_ci DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_digest`
--

CREATE TABLE `b_user_digest` (
  `USER_ID` int(11) NOT NULL,
  `DIGEST_HA1` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_field`
--

CREATE TABLE `b_user_field` (
  `ID` int(11) NOT NULL,
  `ENTITY_ID` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD_NAME` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MANDATORY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_FILTER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `IS_SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SETTINGS` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_field_confirm`
--

CREATE TABLE `b_user_field_confirm` (
  `ID` int(18) NOT NULL,
  `USER_ID` int(18) NOT NULL,
  `DATE_CHANGE` timestamp NULL DEFAULT NULL,
  `FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FIELD_VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIRM_CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_field_enum`
--

CREATE TABLE `b_user_field_enum` (
  `ID` int(11) NOT NULL,
  `USER_FIELD_ID` int(11) DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_field_lang`
--

CREATE TABLE `b_user_field_lang` (
  `USER_FIELD_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EDIT_FORM_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_COLUMN_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_FILTER_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERROR_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HELP_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_group`
--

CREATE TABLE `b_user_group` (
  `USER_ID` int(18) NOT NULL,
  `GROUP_ID` int(18) NOT NULL,
  `DATE_ACTIVE_FROM` datetime DEFAULT NULL,
  `DATE_ACTIVE_TO` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_user_group`
--

INSERT INTO `b_user_group` (`USER_ID`, `GROUP_ID`, `DATE_ACTIVE_FROM`, `DATE_ACTIVE_TO`) VALUES
(1, 1, NULL, NULL),
(1, 3, NULL, NULL),
(1, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_hit_auth`
--

CREATE TABLE `b_user_hit_auth` (
  `ID` int(18) NOT NULL,
  `USER_ID` int(18) NOT NULL,
  `HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_option`
--

CREATE TABLE `b_user_option` (
  `ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `CATEGORY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` mediumtext COLLATE utf8_unicode_ci,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_user_option`
--

INSERT INTO `b_user_option` (`ID`, `USER_ID`, `CATEGORY`, `NAME`, `VALUE`, `COMMON`) VALUES
(1, 0, 'intranet', '~gadgets_admin_index', 'a:1:{i:0;a:1:{s:7:\"GADGETS\";a:8:{s:20:\"ADMIN_INFO@333333333\";a:3:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";}s:19:\"HTML_AREA@444444444\";a:5:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";s:8:\"USERDATA\";a:1:{s:7:\"content\";s:797:\"<table class=\"bx-gadgets-info-site-table\" cellspacing=\"0\"><tr>	<td class=\"bx-gadget-gray\">Создатель сайта:</td>	<td>Группа компаний &laquo;1С-Битрикс&raquo;.</td>	<td class=\"bx-gadgets-info-site-logo\" rowspan=\"5\"><img src=\"/bitrix/components/bitrix/desktop/templates/admin/images/site_logo.png\"></td></tr><tr>	<td class=\"bx-gadget-gray\">Адрес сайта:</td>	<td><a href=\"http://www.1c-bitrix.ru\">www.1c-bitrix.ru</a></td></tr><tr>	<td class=\"bx-gadget-gray\">Сайт сдан:</td>	<td>12 декабря 2010 г.</td></tr><tr>	<td class=\"bx-gadget-gray\">Ответственное лицо:</td>	<td>Иван Иванов</td></tr><tr>	<td class=\"bx-gadget-gray\">E-mail:</td>	<td><a href=\"mailto:info@1c-bitrix.ru\">info@1c-bitrix.ru</a></td></tr></table>\";}s:8:\"SETTINGS\";a:1:{s:9:\"TITLE_STD\";s:34:\"Информация о сайте\";}}s:25:\"ADMIN_CHECKLIST@777888999\";a:3:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:2;s:4:\"HIDE\";s:1:\"N\";}s:19:\"RSSREADER@777777777\";a:4:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:3;s:4:\"HIDE\";s:1:\"N\";s:8:\"SETTINGS\";a:3:{s:9:\"TITLE_STD\";s:33:\"Новости 1С-Битрикс\";s:3:\"CNT\";i:10;s:7:\"RSS_URL\";s:45:\"https://www.1c-bitrix.ru/about/life/news/rss/\";}}s:24:\"ADMIN_SECURITY@555555555\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";}s:25:\"ADMIN_SITESPEED@666666777\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";}s:23:\"ADMIN_PERFMON@666666666\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:2;s:4:\"HIDE\";s:1:\"N\";}s:23:\"ADMIN_MARKETPALCE@22549\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:3;s:4:\"HIDE\";s:1:\"N\";}}}}', 'Y'),
(2, 1, 'admin_panel', 'settings', 'a:1:{s:4:\"edit\";s:3:\"off\";}', 'N'),
(3, 1, 'hot_keys', 'user_defined', 'b:1;', 'N'),
(4, 1, 'favorite', 'favorite_menu', 'a:1:{s:5:\"stick\";s:1:\"N\";}', 'N'),
(5, 1, 'main', 'helper_hero_admin', 'a:1:{s:4:\"time\";s:10:\"1503848295\";}', 'N'),
(8, 1, 'fileman', 'code_editor', 'a:1:{s:5:\"theme\";s:5:\"light\";}', 'N'),
(10, 1, 'admin_menu', 'pos', 'a:1:{s:8:\"sections\";s:88:\"menu_users,menu_iblock_%2Fcatalog%2F1,menu_iblock,iblock_redirect,menu_iblock_/catalog/1\";}', 'N'),
(22, 1, 'fileman', 'file_dialog_config', 's:24:\"s1;/upload;list;type;asc\";', 'N'),
(43, 1, 'checklist', 'autotest_start', 's:1:\"Y\";', 'N'),
(45, 0, 'checklist', 'autotest_start', 's:1:\"Y\";', 'Y'),
(77, 1, 'html_editor', 'user_settings_', 'a:3:{s:4:\"view\";s:5:\"split\";s:13:\"taskbar_shown\";s:1:\"1\";s:14:\"split_vertical\";s:1:\"0\";}', 'N'),
(86, 1, 'list', 'tbl_iblock_section_160552fecab66c961b2b218b964e1a9a', 'a:4:{s:7:\"columns\";s:43:\"NAME,ACTIVE,SORT,TIMESTAMP_X,ID,ELEMENT_CNT\";s:2:\"by\";s:11:\"timestamp_x\";s:5:\"order\";s:4:\"desc\";s:9:\"page_size\";s:2:\"50\";}', 'N'),
(105, 1, 'bx.windowmanager.9.5', 'size_/bitrix/admin/component_props.php', 'a:2:{s:5:\"width\";s:4:\"1032\";s:6:\"height\";s:3:\"509\";}', 'N'),
(106, 1, 'bx.windowmanager.9.5', 'size_/bitrix/admin/public_file_edit.php', 'a:2:{s:5:\"width\";s:4:\"1008\";s:6:\"height\";s:3:\"665\";}', 'N');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_stored_auth`
--

CREATE TABLE `b_user_stored_auth` (
  `ID` int(18) NOT NULL,
  `USER_ID` int(18) NOT NULL,
  `DATE_REG` datetime NOT NULL,
  `LAST_AUTH` datetime NOT NULL,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TEMP_HASH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IP_ADDR` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_user_stored_auth`
--

INSERT INTO `b_user_stored_auth` (`ID`, `USER_ID`, `DATE_REG`, `LAST_AUTH`, `STORED_HASH`, `TEMP_HASH`, `IP_ADDR`) VALUES
(1, 1, '2017-08-16 21:21:24', '2017-08-27 20:19:21', '734706dd5189ef606c3cc14a65019004', 'N', 2130706433),
(2, 1, '2017-08-17 20:30:00', '2017-08-27 20:23:00', 'd017b4003788e3e0fe8ec403de06ed6b', 'N', 2130706433);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `b_admin_notify`
--
ALTER TABLE `b_admin_notify`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_AD_TAG` (`TAG`);

--
-- Индексы таблицы `b_admin_notify_lang`
--
ALTER TABLE `b_admin_notify_lang`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_ADM_NTFY_LANG` (`NOTIFY_ID`,`LID`),
  ADD KEY `IX_ADM_NTFY_LID` (`LID`);

--
-- Индексы таблицы `b_agent`
--
ALTER TABLE `b_agent`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_act_next_exec` (`ACTIVE`,`NEXT_EXEC`),
  ADD KEY `ix_agent_user_id` (`USER_ID`);

--
-- Индексы таблицы `b_app_password`
--
ALTER TABLE `b_app_password`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_app_password_user` (`USER_ID`);

--
-- Индексы таблицы `b_b24connector_buttons`
--
ALTER TABLE `b_b24connector_buttons`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_bitrixcloud_option`
--
ALTER TABLE `b_bitrixcloud_option`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_bitrixcloud_option_1` (`NAME`);

--
-- Индексы таблицы `b_cache_tag`
--
ALTER TABLE `b_cache_tag`
  ADD KEY `ix_b_cache_tag_0` (`SITE_ID`,`CACHE_SALT`,`RELATIVE_PATH`(50)),
  ADD KEY `ix_b_cache_tag_1` (`TAG`);

--
-- Индексы таблицы `b_captcha`
--
ALTER TABLE `b_captcha`
  ADD UNIQUE KEY `UX_B_CAPTCHA` (`ID`);

--
-- Индексы таблицы `b_checklist`
--
ALTER TABLE `b_checklist`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_clouds_file_bucket`
--
ALTER TABLE `b_clouds_file_bucket`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_clouds_file_resize`
--
ALTER TABLE `b_clouds_file_resize`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_file_resize_ts` (`TIMESTAMP_X`),
  ADD KEY `ix_b_file_resize_path` (`TO_PATH`(100)),
  ADD KEY `ix_b_file_resize_file` (`FILE_ID`);

--
-- Индексы таблицы `b_clouds_file_upload`
--
ALTER TABLE `b_clouds_file_upload`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_component_params`
--
ALTER TABLE `b_component_params`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_comp_params_name` (`COMPONENT_NAME`),
  ADD KEY `ix_comp_params_path` (`SITE_ID`,`REAL_PATH`),
  ADD KEY `ix_comp_params_sname` (`SITE_ID`,`COMPONENT_NAME`);

--
-- Индексы таблицы `b_consent_agreement`
--
ALTER TABLE `b_consent_agreement`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_CONSENT_AGREEMENT_CODE` (`CODE`);

--
-- Индексы таблицы `b_consent_field`
--
ALTER TABLE `b_consent_field`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_CONSENT_FIELD_AG_ID` (`AGREEMENT_ID`);

--
-- Индексы таблицы `b_consent_user_consent`
--
ALTER TABLE `b_consent_user_consent`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_CONSENT_USER_CONSENT` (`AGREEMENT_ID`);

--
-- Индексы таблицы `b_counter_data`
--
ALTER TABLE `b_counter_data`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_culture`
--
ALTER TABLE `b_culture`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_event`
--
ALTER TABLE `b_event`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_success` (`SUCCESS_EXEC`),
  ADD KEY `ix_b_event_date_exec` (`DATE_EXEC`);

--
-- Индексы таблицы `b_event_attachment`
--
ALTER TABLE `b_event_attachment`
  ADD PRIMARY KEY (`EVENT_ID`,`FILE_ID`);

--
-- Индексы таблицы `b_event_log`
--
ALTER TABLE `b_event_log`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_event_log_time` (`TIMESTAMP_X`);

--
-- Индексы таблицы `b_event_message`
--
ALTER TABLE `b_event_message`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_event_message_name` (`EVENT_NAME`(50));

--
-- Индексы таблицы `b_event_message_attachment`
--
ALTER TABLE `b_event_message_attachment`
  ADD PRIMARY KEY (`EVENT_MESSAGE_ID`,`FILE_ID`);

--
-- Индексы таблицы `b_event_message_site`
--
ALTER TABLE `b_event_message_site`
  ADD PRIMARY KEY (`EVENT_MESSAGE_ID`,`SITE_ID`);

--
-- Индексы таблицы `b_event_type`
--
ALTER TABLE `b_event_type`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_1` (`EVENT_NAME`,`LID`);

--
-- Индексы таблицы `b_favorite`
--
ALTER TABLE `b_favorite`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_file`
--
ALTER TABLE `b_file`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_FILE_EXTERNAL_ID` (`EXTERNAL_ID`);

--
-- Индексы таблицы `b_file_search`
--
ALTER TABLE `b_file_search`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_filters`
--
ALTER TABLE `b_filters`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_finder_dest`
--
ALTER TABLE `b_finder_dest`
  ADD PRIMARY KEY (`USER_ID`,`CODE`,`CONTEXT`),
  ADD KEY `IX_FINDER_DEST` (`CODE_TYPE`);

--
-- Индексы таблицы `b_geoip_handlers`
--
ALTER TABLE `b_geoip_handlers`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_group`
--
ALTER TABLE `b_group`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_group_collection_task`
--
ALTER TABLE `b_group_collection_task`
  ADD PRIMARY KEY (`GROUP_ID`,`TASK_ID`,`COLLECTION_ID`);

--
-- Индексы таблицы `b_group_subordinate`
--
ALTER TABLE `b_group_subordinate`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_group_task`
--
ALTER TABLE `b_group_task`
  ADD PRIMARY KEY (`GROUP_ID`,`TASK_ID`);

--
-- Индексы таблицы `b_hlblock_entity`
--
ALTER TABLE `b_hlblock_entity`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_hlblock_entity_rights`
--
ALTER TABLE `b_hlblock_entity_rights`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_hot_keys`
--
ALTER TABLE `b_hot_keys`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ix_b_hot_keys_co_u` (`CODE_ID`,`USER_ID`),
  ADD KEY `ix_hot_keys_code` (`CODE_ID`),
  ADD KEY `ix_hot_keys_user` (`USER_ID`);

--
-- Индексы таблицы `b_hot_keys_code`
--
ALTER TABLE `b_hot_keys_code`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_hot_keys_code_cn` (`CLASS_NAME`),
  ADD KEY `ix_hot_keys_code_url` (`URL`);

--
-- Индексы таблицы `b_iblock`
--
ALTER TABLE `b_iblock`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_iblock` (`IBLOCK_TYPE_ID`,`LID`,`ACTIVE`);

--
-- Индексы таблицы `b_iblock_cache`
--
ALTER TABLE `b_iblock_cache`
  ADD PRIMARY KEY (`CACHE_KEY`);

--
-- Индексы таблицы `b_iblock_element`
--
ALTER TABLE `b_iblock_element`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_iblock_element_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  ADD KEY `ix_iblock_element_4` (`IBLOCK_ID`,`XML_ID`,`WF_PARENT_ELEMENT_ID`),
  ADD KEY `ix_iblock_element_3` (`WF_PARENT_ELEMENT_ID`),
  ADD KEY `ix_iblock_element_code` (`IBLOCK_ID`,`CODE`);

--
-- Индексы таблицы `b_iblock_element_iprop`
--
ALTER TABLE `b_iblock_element_iprop`
  ADD PRIMARY KEY (`ELEMENT_ID`,`IPROP_ID`),
  ADD KEY `ix_b_iblock_element_iprop_0` (`IPROP_ID`),
  ADD KEY `ix_b_iblock_element_iprop_1` (`IBLOCK_ID`);

--
-- Индексы таблицы `b_iblock_element_lock`
--
ALTER TABLE `b_iblock_element_lock`
  ADD PRIMARY KEY (`IBLOCK_ELEMENT_ID`);

--
-- Индексы таблицы `b_iblock_element_property`
--
ALTER TABLE `b_iblock_element_property`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_iblock_element_property_1` (`IBLOCK_ELEMENT_ID`,`IBLOCK_PROPERTY_ID`),
  ADD KEY `ix_iblock_element_property_2` (`IBLOCK_PROPERTY_ID`),
  ADD KEY `ix_iblock_element_prop_enum` (`VALUE_ENUM`,`IBLOCK_PROPERTY_ID`),
  ADD KEY `ix_iblock_element_prop_num` (`VALUE_NUM`,`IBLOCK_PROPERTY_ID`);

--
-- Индексы таблицы `b_iblock_element_right`
--
ALTER TABLE `b_iblock_element_right`
  ADD PRIMARY KEY (`RIGHT_ID`,`ELEMENT_ID`,`SECTION_ID`),
  ADD KEY `ix_b_iblock_element_right_1` (`ELEMENT_ID`,`IBLOCK_ID`),
  ADD KEY `ix_b_iblock_element_right_2` (`IBLOCK_ID`,`RIGHT_ID`);

--
-- Индексы таблицы `b_iblock_fields`
--
ALTER TABLE `b_iblock_fields`
  ADD PRIMARY KEY (`IBLOCK_ID`,`FIELD_ID`);

--
-- Индексы таблицы `b_iblock_group`
--
ALTER TABLE `b_iblock_group`
  ADD UNIQUE KEY `ux_iblock_group_1` (`IBLOCK_ID`,`GROUP_ID`);

--
-- Индексы таблицы `b_iblock_iblock_iprop`
--
ALTER TABLE `b_iblock_iblock_iprop`
  ADD PRIMARY KEY (`IBLOCK_ID`,`IPROP_ID`),
  ADD KEY `ix_b_iblock_iblock_iprop_0` (`IPROP_ID`);

--
-- Индексы таблицы `b_iblock_iproperty`
--
ALTER TABLE `b_iblock_iproperty`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_iblock_iprop_0` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`);

--
-- Индексы таблицы `b_iblock_messages`
--
ALTER TABLE `b_iblock_messages`
  ADD PRIMARY KEY (`IBLOCK_ID`,`MESSAGE_ID`);

--
-- Индексы таблицы `b_iblock_offers_tmp`
--
ALTER TABLE `b_iblock_offers_tmp`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_iblock_property`
--
ALTER TABLE `b_iblock_property`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_iblock_property_1` (`IBLOCK_ID`),
  ADD KEY `ix_iblock_property_3` (`LINK_IBLOCK_ID`),
  ADD KEY `ix_iblock_property_2` (`CODE`);

--
-- Индексы таблицы `b_iblock_property_enum`
--
ALTER TABLE `b_iblock_property_enum`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_iblock_property_enum` (`PROPERTY_ID`,`XML_ID`);

--
-- Индексы таблицы `b_iblock_right`
--
ALTER TABLE `b_iblock_right`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_iblock_right_iblock_id` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`),
  ADD KEY `ix_b_iblock_right_group_code` (`GROUP_CODE`,`IBLOCK_ID`),
  ADD KEY `ix_b_iblock_right_entity` (`ENTITY_ID`,`ENTITY_TYPE`),
  ADD KEY `ix_b_iblock_right_op_eread` (`ID`,`OP_EREAD`,`GROUP_CODE`),
  ADD KEY `ix_b_iblock_right_op_sread` (`ID`,`OP_SREAD`,`GROUP_CODE`),
  ADD KEY `ix_b_iblock_right_task_id` (`TASK_ID`);

--
-- Индексы таблицы `b_iblock_rss`
--
ALTER TABLE `b_iblock_rss`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_iblock_section`
--
ALTER TABLE `b_iblock_section`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_iblock_section_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  ADD KEY `ix_iblock_section_depth_level` (`IBLOCK_ID`,`DEPTH_LEVEL`),
  ADD KEY `ix_iblock_section_left_margin` (`IBLOCK_ID`,`LEFT_MARGIN`,`RIGHT_MARGIN`),
  ADD KEY `ix_iblock_section_right_margin` (`IBLOCK_ID`,`RIGHT_MARGIN`,`LEFT_MARGIN`),
  ADD KEY `ix_iblock_section_code` (`IBLOCK_ID`,`CODE`);

--
-- Индексы таблицы `b_iblock_section_element`
--
ALTER TABLE `b_iblock_section_element`
  ADD UNIQUE KEY `ux_iblock_section_element` (`IBLOCK_SECTION_ID`,`IBLOCK_ELEMENT_ID`,`ADDITIONAL_PROPERTY_ID`),
  ADD KEY `UX_IBLOCK_SECTION_ELEMENT2` (`IBLOCK_ELEMENT_ID`);

--
-- Индексы таблицы `b_iblock_section_iprop`
--
ALTER TABLE `b_iblock_section_iprop`
  ADD PRIMARY KEY (`SECTION_ID`,`IPROP_ID`),
  ADD KEY `ix_b_iblock_section_iprop_0` (`IPROP_ID`),
  ADD KEY `ix_b_iblock_section_iprop_1` (`IBLOCK_ID`);

--
-- Индексы таблицы `b_iblock_section_property`
--
ALTER TABLE `b_iblock_section_property`
  ADD PRIMARY KEY (`IBLOCK_ID`,`SECTION_ID`,`PROPERTY_ID`),
  ADD KEY `ix_b_iblock_section_property_1` (`PROPERTY_ID`),
  ADD KEY `ix_b_iblock_section_property_2` (`SECTION_ID`);

--
-- Индексы таблицы `b_iblock_section_right`
--
ALTER TABLE `b_iblock_section_right`
  ADD PRIMARY KEY (`RIGHT_ID`,`SECTION_ID`),
  ADD KEY `ix_b_iblock_section_right_1` (`SECTION_ID`,`IBLOCK_ID`),
  ADD KEY `ix_b_iblock_section_right_2` (`IBLOCK_ID`,`RIGHT_ID`);

--
-- Индексы таблицы `b_iblock_sequence`
--
ALTER TABLE `b_iblock_sequence`
  ADD PRIMARY KEY (`IBLOCK_ID`,`CODE`);

--
-- Индексы таблицы `b_iblock_site`
--
ALTER TABLE `b_iblock_site`
  ADD PRIMARY KEY (`IBLOCK_ID`,`SITE_ID`);

--
-- Индексы таблицы `b_iblock_type`
--
ALTER TABLE `b_iblock_type`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_lang`
--
ALTER TABLE `b_lang`
  ADD PRIMARY KEY (`LID`);

--
-- Индексы таблицы `b_lang_domain`
--
ALTER TABLE `b_lang_domain`
  ADD PRIMARY KEY (`LID`,`DOMAIN`);

--
-- Индексы таблицы `b_language`
--
ALTER TABLE `b_language`
  ADD PRIMARY KEY (`LID`);

--
-- Индексы таблицы `b_medialib_collection`
--
ALTER TABLE `b_medialib_collection`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_medialib_collection_item`
--
ALTER TABLE `b_medialib_collection_item`
  ADD PRIMARY KEY (`ITEM_ID`,`COLLECTION_ID`);

--
-- Индексы таблицы `b_medialib_item`
--
ALTER TABLE `b_medialib_item`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_medialib_type`
--
ALTER TABLE `b_medialib_type`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_module`
--
ALTER TABLE `b_module`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_module_group`
--
ALTER TABLE `b_module_group`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_GROUP_MODULE` (`MODULE_ID`,`GROUP_ID`,`SITE_ID`);

--
-- Индексы таблицы `b_module_to_module`
--
ALTER TABLE `b_module_to_module`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_module_to_module` (`FROM_MODULE_ID`(20),`MESSAGE_ID`(20),`TO_MODULE_ID`(20),`TO_CLASS`(20),`TO_METHOD`(20));

--
-- Индексы таблицы `b_operation`
--
ALTER TABLE `b_operation`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_option`
--
ALTER TABLE `b_option`
  ADD UNIQUE KEY `ix_option` (`MODULE_ID`,`NAME`,`SITE_ID`),
  ADD KEY `ix_option_name` (`NAME`);

--
-- Индексы таблицы `b_perf_cache`
--
ALTER TABLE `b_perf_cache`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_B_PERF_CACHE_0` (`HIT_ID`,`NN`),
  ADD KEY `IX_B_PERF_CACHE_1` (`COMPONENT_ID`);

--
-- Индексы таблицы `b_perf_cluster`
--
ALTER TABLE `b_perf_cluster`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_perf_component`
--
ALTER TABLE `b_perf_component`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_B_PERF_COMPONENT_0` (`HIT_ID`,`NN`);

--
-- Индексы таблицы `b_perf_error`
--
ALTER TABLE `b_perf_error`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_PERF_ERROR_0` (`HIT_ID`);

--
-- Индексы таблицы `b_perf_history`
--
ALTER TABLE `b_perf_history`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_perf_hit`
--
ALTER TABLE `b_perf_hit`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_PERF_HIT_0` (`DATE_HIT`);

--
-- Индексы таблицы `b_perf_index_ban`
--
ALTER TABLE `b_perf_index_ban`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_perf_index_complete`
--
ALTER TABLE `b_perf_index_complete`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_perf_index_complete_0` (`TABLE_NAME`);

--
-- Индексы таблицы `b_perf_index_suggest`
--
ALTER TABLE `b_perf_index_suggest`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_perf_index_suggest_0` (`SQL_MD5`);

--
-- Индексы таблицы `b_perf_index_suggest_sql`
--
ALTER TABLE `b_perf_index_suggest_sql`
  ADD PRIMARY KEY (`SUGGEST_ID`,`SQL_ID`),
  ADD KEY `ix_b_perf_index_suggest_sql_0` (`SQL_ID`,`SUGGEST_ID`);

--
-- Индексы таблицы `b_perf_sql`
--
ALTER TABLE `b_perf_sql`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_B_PERF_SQL_0` (`HIT_ID`,`NN`),
  ADD KEY `IX_B_PERF_SQL_1` (`COMPONENT_ID`);

--
-- Индексы таблицы `b_perf_sql_backtrace`
--
ALTER TABLE `b_perf_sql_backtrace`
  ADD PRIMARY KEY (`SQL_ID`,`NN`);

--
-- Индексы таблицы `b_perf_tab_column_stat`
--
ALTER TABLE `b_perf_tab_column_stat`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_perf_tab_column_stat` (`TABLE_NAME`,`COLUMN_NAME`);

--
-- Индексы таблицы `b_perf_tab_stat`
--
ALTER TABLE `b_perf_tab_stat`
  ADD PRIMARY KEY (`TABLE_NAME`);

--
-- Индексы таблицы `b_perf_test`
--
ALTER TABLE `b_perf_test`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_PERF_TEST_0` (`REFERENCE_ID`);

--
-- Индексы таблицы `b_rating`
--
ALTER TABLE `b_rating`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_rating_component`
--
ALTER TABLE `b_rating_component`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_RATING_ID_1` (`RATING_ID`,`ACTIVE`,`NEXT_CALCULATION`);

--
-- Индексы таблицы `b_rating_component_results`
--
ALTER TABLE `b_rating_component_results`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  ADD KEY `IX_COMPLEX_NAME` (`COMPLEX_NAME`),
  ADD KEY `IX_RATING_ID_2` (`RATING_ID`,`COMPLEX_NAME`);

--
-- Индексы таблицы `b_rating_results`
--
ALTER TABLE `b_rating_results`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_RATING_3` (`RATING_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`),
  ADD KEY `IX_RATING_4` (`RATING_ID`,`ENTITY_ID`);

--
-- Индексы таблицы `b_rating_rule`
--
ALTER TABLE `b_rating_rule`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_rating_rule_vetting`
--
ALTER TABLE `b_rating_rule_vetting`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RULE_ID` (`RULE_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`);

--
-- Индексы таблицы `b_rating_user`
--
ALTER TABLE `b_rating_user`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RATING_ID` (`RATING_ID`,`ENTITY_ID`),
  ADD KEY `IX_B_RAT_USER_2` (`ENTITY_ID`);

--
-- Индексы таблицы `b_rating_vote`
--
ALTER TABLE `b_rating_vote`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_RAT_VOTE_ID` (`RATING_VOTING_ID`,`USER_ID`),
  ADD KEY `IX_RAT_VOTE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`USER_ID`),
  ADD KEY `IX_RAT_VOTE_ID_3` (`OWNER_ID`,`CREATED`),
  ADD KEY `IX_RAT_VOTE_ID_4` (`USER_ID`),
  ADD KEY `IX_RAT_VOTE_ID_5` (`CREATED`,`VALUE`),
  ADD KEY `IX_RAT_VOTE_ID_6` (`ACTIVE`),
  ADD KEY `IX_RAT_VOTE_ID_7` (`RATING_VOTING_ID`,`CREATED`),
  ADD KEY `IX_RAT_VOTE_ID_8` (`ENTITY_TYPE_ID`,`CREATED`),
  ADD KEY `IX_RAT_VOTE_ID_9` (`CREATED`,`USER_ID`);

--
-- Индексы таблицы `b_rating_vote_group`
--
ALTER TABLE `b_rating_vote_group`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RATING_ID` (`GROUP_ID`,`TYPE`);

--
-- Индексы таблицы `b_rating_voting`
--
ALTER TABLE `b_rating_voting`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_ENTITY_TYPE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`ACTIVE`),
  ADD KEY `IX_ENTITY_TYPE_ID_4` (`TOTAL_VALUE`);

--
-- Индексы таблицы `b_rating_voting_prepare`
--
ALTER TABLE `b_rating_voting_prepare`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_RATING_VOTING_ID` (`RATING_VOTING_ID`);

--
-- Индексы таблицы `b_rating_weight`
--
ALTER TABLE `b_rating_weight`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_search_content`
--
ALTER TABLE `b_search_content`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UX_B_SEARCH_CONTENT` (`MODULE_ID`,`ITEM_ID`),
  ADD KEY `IX_B_SEARCH_CONTENT_1` (`MODULE_ID`,`PARAM1`(50),`PARAM2`(50)),
  ADD KEY `IX_B_SEARCH_CONTENT_2` (`ENTITY_ID`(50),`ENTITY_TYPE_ID`);

--
-- Индексы таблицы `b_search_content_freq`
--
ALTER TABLE `b_search_content_freq`
  ADD UNIQUE KEY `UX_B_SEARCH_CONTENT_FREQ` (`STEM`,`LANGUAGE_ID`,`SITE_ID`);

--
-- Индексы таблицы `b_search_content_param`
--
ALTER TABLE `b_search_content_param`
  ADD KEY `IX_B_SEARCH_CONTENT_PARAM` (`SEARCH_CONTENT_ID`,`PARAM_NAME`),
  ADD KEY `IX_B_SEARCH_CONTENT_PARAM_1` (`PARAM_NAME`,`PARAM_VALUE`(50),`SEARCH_CONTENT_ID`);

--
-- Индексы таблицы `b_search_content_right`
--
ALTER TABLE `b_search_content_right`
  ADD UNIQUE KEY `UX_B_SEARCH_CONTENT_RIGHT` (`SEARCH_CONTENT_ID`,`GROUP_CODE`);

--
-- Индексы таблицы `b_search_content_site`
--
ALTER TABLE `b_search_content_site`
  ADD PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`);

--
-- Индексы таблицы `b_search_content_stem`
--
ALTER TABLE `b_search_content_stem`
  ADD UNIQUE KEY `UX_B_SEARCH_CONTENT_STEM` (`STEM`,`LANGUAGE_ID`,`TF`,`PS`,`SEARCH_CONTENT_ID`),
  ADD KEY `IND_B_SEARCH_CONTENT_STEM` (`SEARCH_CONTENT_ID`);

--
-- Индексы таблицы `b_search_content_text`
--
ALTER TABLE `b_search_content_text`
  ADD PRIMARY KEY (`SEARCH_CONTENT_ID`);

--
-- Индексы таблицы `b_search_content_title`
--
ALTER TABLE `b_search_content_title`
  ADD UNIQUE KEY `UX_B_SEARCH_CONTENT_TITLE` (`SITE_ID`,`WORD`,`SEARCH_CONTENT_ID`,`POS`),
  ADD KEY `IND_B_SEARCH_CONTENT_TITLE` (`SEARCH_CONTENT_ID`);

--
-- Индексы таблицы `b_search_custom_rank`
--
ALTER TABLE `b_search_custom_rank`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IND_B_SEARCH_CUSTOM_RANK` (`SITE_ID`,`MODULE_ID`);

--
-- Индексы таблицы `b_search_phrase`
--
ALTER TABLE `b_search_phrase`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IND_PK_B_SEARCH_PHRASE_SESS_PH` (`SESSION_ID`,`PHRASE`(50)),
  ADD KEY `IND_PK_B_SEARCH_PHRASE_SESS_TG` (`SESSION_ID`,`TAGS`(50)),
  ADD KEY `IND_PK_B_SEARCH_PHRASE_TIME` (`TIMESTAMP_X`);

--
-- Индексы таблицы `b_search_stem`
--
ALTER TABLE `b_search_stem`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UX_B_SEARCH_STEM` (`STEM`);

--
-- Индексы таблицы `b_search_suggest`
--
ALTER TABLE `b_search_suggest`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IND_B_SEARCH_SUGGEST` (`FILTER_MD5`,`PHRASE`(50),`RATE`),
  ADD KEY `IND_B_SEARCH_SUGGEST_PHRASE` (`PHRASE`(50),`RATE`),
  ADD KEY `IND_B_SEARCH_SUGGEST_TIME` (`TIMESTAMP_X`);

--
-- Индексы таблицы `b_search_tags`
--
ALTER TABLE `b_search_tags`
  ADD PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`,`NAME`),
  ADD KEY `IX_B_SEARCH_TAGS_0` (`NAME`);

--
-- Индексы таблицы `b_search_user_right`
--
ALTER TABLE `b_search_user_right`
  ADD UNIQUE KEY `UX_B_SEARCH_USER_RIGHT` (`USER_ID`,`GROUP_CODE`);

--
-- Индексы таблицы `b_seo_adv_autolog`
--
ALTER TABLE `b_seo_adv_autolog`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_seo_adv_autolog1` (`ENGINE_ID`),
  ADD KEY `ix_b_seo_adv_autolog2` (`TIMESTAMP_X`);

--
-- Индексы таблицы `b_seo_adv_banner`
--
ALTER TABLE `b_seo_adv_banner`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_seo_adv_banner` (`ENGINE_ID`,`XML_ID`),
  ADD KEY `ix_b_seo_adv_banner1` (`CAMPAIGN_ID`),
  ADD KEY `ix_b_seo_adv_banner2` (`AUTO_QUANTITY_OFF`,`AUTO_QUANTITY_ON`);

--
-- Индексы таблицы `b_seo_adv_campaign`
--
ALTER TABLE `b_seo_adv_campaign`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_seo_adv_campaign` (`ENGINE_ID`,`XML_ID`);

--
-- Индексы таблицы `b_seo_adv_group`
--
ALTER TABLE `b_seo_adv_group`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_seo_adv_group` (`ENGINE_ID`,`XML_ID`),
  ADD KEY `ix_b_seo_adv_group1` (`CAMPAIGN_ID`);

--
-- Индексы таблицы `b_seo_adv_link`
--
ALTER TABLE `b_seo_adv_link`
  ADD PRIMARY KEY (`LINK_TYPE`,`LINK_ID`,`BANNER_ID`);

--
-- Индексы таблицы `b_seo_adv_log`
--
ALTER TABLE `b_seo_adv_log`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_seo_adv_log1` (`ENGINE_ID`),
  ADD KEY `ix_b_seo_adv_log2` (`TIMESTAMP_X`);

--
-- Индексы таблицы `b_seo_adv_order`
--
ALTER TABLE `b_seo_adv_order`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_seo_adv_order` (`ENGINE_ID`,`CAMPAIGN_ID`,`BANNER_ID`,`ORDER_ID`),
  ADD KEY `ix_b_seo_adv_order1` (`ORDER_ID`,`PROCESSED`);

--
-- Индексы таблицы `b_seo_adv_region`
--
ALTER TABLE `b_seo_adv_region`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_seo_adv_region` (`ENGINE_ID`,`XML_ID`),
  ADD KEY `ix_b_seo_adv_region1` (`PARENT_ID`);

--
-- Индексы таблицы `b_seo_keywords`
--
ALTER TABLE `b_seo_keywords`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_seo_keywords_url` (`URL`,`SITE_ID`);

--
-- Индексы таблицы `b_seo_search_engine`
--
ALTER TABLE `b_seo_search_engine`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_seo_search_engine_code` (`CODE`);

--
-- Индексы таблицы `b_seo_service_log`
--
ALTER TABLE `b_seo_service_log`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_seo_service_rtg_queue`
--
ALTER TABLE `b_seo_service_rtg_queue`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_SEO_SRV_RTG_QUEUE_1` (`ACTION`,`DATE_AUTO_REMOVE`),
  ADD KEY `IX_B_SEO_SRV_RTG_QUEUE_2` (`TYPE`,`ACTION`);

--
-- Индексы таблицы `b_seo_sitemap`
--
ALTER TABLE `b_seo_sitemap`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_seo_sitemap_entity`
--
ALTER TABLE `b_seo_sitemap_entity`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_seo_sitemap_entity_1` (`ENTITY_TYPE`,`ENTITY_ID`),
  ADD KEY `ix_b_seo_sitemap_entity_2` (`SITEMAP_ID`);

--
-- Индексы таблицы `b_seo_sitemap_iblock`
--
ALTER TABLE `b_seo_sitemap_iblock`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_seo_sitemap_iblock_1` (`IBLOCK_ID`),
  ADD KEY `ix_b_seo_sitemap_iblock_2` (`SITEMAP_ID`);

--
-- Индексы таблицы `b_seo_sitemap_runtime`
--
ALTER TABLE `b_seo_sitemap_runtime`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_seo_sitemap_runtime1` (`PID`,`PROCESSED`,`ITEM_TYPE`,`ITEM_ID`);

--
-- Индексы таблицы `b_seo_yandex_direct_stat`
--
ALTER TABLE `b_seo_yandex_direct_stat`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_seo_yandex_direct_stat` (`BANNER_ID`,`DATE_DAY`),
  ADD KEY `ix_seo_yandex_direct_stat1` (`CAMPAIGN_ID`);

--
-- Индексы таблицы `b_short_uri`
--
ALTER TABLE `b_short_uri`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ux_b_short_uri_1` (`SHORT_URI_CRC`),
  ADD KEY `ux_b_short_uri_2` (`URI_CRC`);

--
-- Индексы таблицы `b_site_template`
--
ALTER TABLE `b_site_template`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_site_template_site` (`SITE_ID`);

--
-- Индексы таблицы `b_smile`
--
ALTER TABLE `b_smile`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_smile_lang`
--
ALTER TABLE `b_smile_lang`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UX_SMILE_SL` (`TYPE`,`SID`,`LID`);

--
-- Индексы таблицы `b_smile_set`
--
ALTER TABLE `b_smile_set`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_socialservices_ap`
--
ALTER TABLE `b_socialservices_ap`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_socialservices_ap1` (`USER_ID`,`DOMAIN`);

--
-- Индексы таблицы `b_socialservices_contact`
--
ALTER TABLE `b_socialservices_contact`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_socialservices_contact1` (`USER_ID`),
  ADD KEY `ix_b_socialservices_contact2` (`CONTACT_USER_ID`),
  ADD KEY `ix_b_socialservices_contact3` (`TIMESTAMP_X`),
  ADD KEY `ix_b_socialservices_contact4` (`LAST_AUTHORIZE`);

--
-- Индексы таблицы `b_socialservices_contact_connect`
--
ALTER TABLE `b_socialservices_contact_connect`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_socialservices_contact_connect1` (`CONTACT_ID`),
  ADD KEY `ix_b_socialservices_contact_connect2` (`LINK_ID`),
  ADD KEY `ix_b_socialservices_contact_connect3` (`LAST_AUTHORIZE`);

--
-- Индексы таблицы `b_socialservices_message`
--
ALTER TABLE `b_socialservices_message`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_socialservices_user`
--
ALTER TABLE `b_socialservices_user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_B_SOCIALSERVICES_USER` (`XML_ID`,`EXTERNAL_AUTH_ID`),
  ADD KEY `IX_B_SOCIALSERVICES_US_1` (`USER_ID`),
  ADD KEY `IX_B_SOCIALSERVICES_US_3` (`LOGIN`);

--
-- Индексы таблицы `b_socialservices_user_link`
--
ALTER TABLE `b_socialservices_user_link`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_socialservices_user_link_5` (`SOCSERV_USER_ID`),
  ADD KEY `ix_b_socialservices_user_link_6` (`LINK_USER_ID`,`TIMESTAMP_X`),
  ADD KEY `ix_b_socialservices_user_link_7` (`LINK_UID`);

--
-- Индексы таблицы `b_sticker`
--
ALTER TABLE `b_sticker`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_sticker_group_task`
--
ALTER TABLE `b_sticker_group_task`
  ADD PRIMARY KEY (`GROUP_ID`,`TASK_ID`);

--
-- Индексы таблицы `b_task`
--
ALTER TABLE `b_task`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_task` (`MODULE_ID`,`BINDING`,`LETTER`,`SYS`);

--
-- Индексы таблицы `b_task_operation`
--
ALTER TABLE `b_task_operation`
  ADD PRIMARY KEY (`TASK_ID`,`OPERATION_ID`);

--
-- Индексы таблицы `b_undo`
--
ALTER TABLE `b_undo`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_urlpreview_metadata`
--
ALTER TABLE `b_urlpreview_metadata`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_URLPREVIEW_METADATA_URL` (`URL`);

--
-- Индексы таблицы `b_urlpreview_route`
--
ALTER TABLE `b_urlpreview_route`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UX_URLPREVIEW_ROUTE_ROUTE` (`ROUTE`);

--
-- Индексы таблицы `b_user`
--
ALTER TABLE `b_user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ix_login` (`LOGIN`,`EXTERNAL_AUTH_ID`),
  ADD KEY `ix_b_user_email` (`EMAIL`),
  ADD KEY `ix_b_user_activity_date` (`LAST_ACTIVITY_DATE`),
  ADD KEY `IX_B_USER_XML_ID` (`XML_ID`);

--
-- Индексы таблицы `b_user_access`
--
ALTER TABLE `b_user_access`
  ADD KEY `ix_ua_user_provider` (`USER_ID`,`PROVIDER_ID`),
  ADD KEY `ix_ua_user_access` (`USER_ID`,`ACCESS_CODE`),
  ADD KEY `ix_ua_access` (`ACCESS_CODE`);

--
-- Индексы таблицы `b_user_access_check`
--
ALTER TABLE `b_user_access_check`
  ADD KEY `ix_uac_user_provider` (`USER_ID`,`PROVIDER_ID`);

--
-- Индексы таблицы `b_user_counter`
--
ALTER TABLE `b_user_counter`
  ADD PRIMARY KEY (`USER_ID`,`SITE_ID`,`CODE`),
  ADD KEY `ix_buc_tag` (`TAG`),
  ADD KEY `ix_buc_code` (`CODE`),
  ADD KEY `ix_buc_ts` (`TIMESTAMP_X`),
  ADD KEY `ix_buc_sent_userid` (`SENT`,`USER_ID`);

--
-- Индексы таблицы `b_user_digest`
--
ALTER TABLE `b_user_digest`
  ADD PRIMARY KEY (`USER_ID`);

--
-- Индексы таблицы `b_user_field`
--
ALTER TABLE `b_user_field`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_user_type_entity` (`ENTITY_ID`,`FIELD_NAME`);

--
-- Индексы таблицы `b_user_field_confirm`
--
ALTER TABLE `b_user_field_confirm`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_user_field_confirm1` (`USER_ID`,`CONFIRM_CODE`);

--
-- Индексы таблицы `b_user_field_enum`
--
ALTER TABLE `b_user_field_enum`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_user_field_enum` (`USER_FIELD_ID`,`XML_ID`);

--
-- Индексы таблицы `b_user_field_lang`
--
ALTER TABLE `b_user_field_lang`
  ADD PRIMARY KEY (`USER_FIELD_ID`,`LANGUAGE_ID`);

--
-- Индексы таблицы `b_user_group`
--
ALTER TABLE `b_user_group`
  ADD UNIQUE KEY `ix_user_group` (`USER_ID`,`GROUP_ID`),
  ADD KEY `ix_user_group_group` (`GROUP_ID`);

--
-- Индексы таблицы `b_user_hit_auth`
--
ALTER TABLE `b_user_hit_auth`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_USER_HIT_AUTH_1` (`HASH`),
  ADD KEY `IX_USER_HIT_AUTH_2` (`USER_ID`),
  ADD KEY `IX_USER_HIT_AUTH_3` (`TIMESTAMP_X`);

--
-- Индексы таблицы `b_user_option`
--
ALTER TABLE `b_user_option`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_user_category_name` (`USER_ID`,`CATEGORY`,`NAME`);

--
-- Индексы таблицы `b_user_stored_auth`
--
ALTER TABLE `b_user_stored_auth`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ux_user_hash` (`USER_ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `b_admin_notify`
--
ALTER TABLE `b_admin_notify`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_admin_notify_lang`
--
ALTER TABLE `b_admin_notify_lang`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_agent`
--
ALTER TABLE `b_agent`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT для таблицы `b_app_password`
--
ALTER TABLE `b_app_password`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_bitrixcloud_option`
--
ALTER TABLE `b_bitrixcloud_option`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `b_checklist`
--
ALTER TABLE `b_checklist`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `b_clouds_file_bucket`
--
ALTER TABLE `b_clouds_file_bucket`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_clouds_file_resize`
--
ALTER TABLE `b_clouds_file_resize`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_component_params`
--
ALTER TABLE `b_component_params`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT для таблицы `b_consent_agreement`
--
ALTER TABLE `b_consent_agreement`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_consent_field`
--
ALTER TABLE `b_consent_field`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_consent_user_consent`
--
ALTER TABLE `b_consent_user_consent`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_culture`
--
ALTER TABLE `b_culture`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `b_event`
--
ALTER TABLE `b_event`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_event_log`
--
ALTER TABLE `b_event_log`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=429;
--
-- AUTO_INCREMENT для таблицы `b_event_message`
--
ALTER TABLE `b_event_message`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `b_event_type`
--
ALTER TABLE `b_event_type`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT для таблицы `b_favorite`
--
ALTER TABLE `b_favorite`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_file`
--
ALTER TABLE `b_file`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_file_search`
--
ALTER TABLE `b_file_search`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_filters`
--
ALTER TABLE `b_filters`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_geoip_handlers`
--
ALTER TABLE `b_geoip_handlers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `b_group`
--
ALTER TABLE `b_group`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `b_hlblock_entity`
--
ALTER TABLE `b_hlblock_entity`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_hlblock_entity_rights`
--
ALTER TABLE `b_hlblock_entity_rights`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_hot_keys`
--
ALTER TABLE `b_hot_keys`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT для таблицы `b_hot_keys_code`
--
ALTER TABLE `b_hot_keys_code`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;
--
-- AUTO_INCREMENT для таблицы `b_iblock`
--
ALTER TABLE `b_iblock`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `b_iblock_element`
--
ALTER TABLE `b_iblock_element`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT для таблицы `b_iblock_element_property`
--
ALTER TABLE `b_iblock_element_property`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=619;
--
-- AUTO_INCREMENT для таблицы `b_iblock_iproperty`
--
ALTER TABLE `b_iblock_iproperty`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_iblock_offers_tmp`
--
ALTER TABLE `b_iblock_offers_tmp`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_iblock_property`
--
ALTER TABLE `b_iblock_property`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `b_iblock_property_enum`
--
ALTER TABLE `b_iblock_property_enum`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_iblock_right`
--
ALTER TABLE `b_iblock_right`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_iblock_rss`
--
ALTER TABLE `b_iblock_rss`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_iblock_section`
--
ALTER TABLE `b_iblock_section`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT для таблицы `b_medialib_collection`
--
ALTER TABLE `b_medialib_collection`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_medialib_item`
--
ALTER TABLE `b_medialib_item`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_medialib_type`
--
ALTER TABLE `b_medialib_type`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `b_module_group`
--
ALTER TABLE `b_module_group`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_module_to_module`
--
ALTER TABLE `b_module_to_module`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;
--
-- AUTO_INCREMENT для таблицы `b_operation`
--
ALTER TABLE `b_operation`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;
--
-- AUTO_INCREMENT для таблицы `b_perf_cache`
--
ALTER TABLE `b_perf_cache`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_perf_cluster`
--
ALTER TABLE `b_perf_cluster`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_perf_component`
--
ALTER TABLE `b_perf_component`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_perf_error`
--
ALTER TABLE `b_perf_error`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_perf_history`
--
ALTER TABLE `b_perf_history`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_perf_hit`
--
ALTER TABLE `b_perf_hit`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_perf_index_ban`
--
ALTER TABLE `b_perf_index_ban`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_perf_index_complete`
--
ALTER TABLE `b_perf_index_complete`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_perf_index_suggest`
--
ALTER TABLE `b_perf_index_suggest`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_perf_sql`
--
ALTER TABLE `b_perf_sql`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_perf_tab_column_stat`
--
ALTER TABLE `b_perf_tab_column_stat`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_perf_test`
--
ALTER TABLE `b_perf_test`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_rating`
--
ALTER TABLE `b_rating`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `b_rating_component`
--
ALTER TABLE `b_rating_component`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_rating_component_results`
--
ALTER TABLE `b_rating_component_results`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_rating_results`
--
ALTER TABLE `b_rating_results`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_rating_rule`
--
ALTER TABLE `b_rating_rule`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `b_rating_rule_vetting`
--
ALTER TABLE `b_rating_rule_vetting`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_rating_user`
--
ALTER TABLE `b_rating_user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `b_rating_vote`
--
ALTER TABLE `b_rating_vote`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_rating_vote_group`
--
ALTER TABLE `b_rating_vote_group`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `b_rating_voting`
--
ALTER TABLE `b_rating_voting`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_rating_voting_prepare`
--
ALTER TABLE `b_rating_voting_prepare`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_rating_weight`
--
ALTER TABLE `b_rating_weight`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `b_search_content`
--
ALTER TABLE `b_search_content`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;
--
-- AUTO_INCREMENT для таблицы `b_search_custom_rank`
--
ALTER TABLE `b_search_custom_rank`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_search_phrase`
--
ALTER TABLE `b_search_phrase`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `b_search_stem`
--
ALTER TABLE `b_search_stem`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=534;
--
-- AUTO_INCREMENT для таблицы `b_search_suggest`
--
ALTER TABLE `b_search_suggest`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_seo_adv_autolog`
--
ALTER TABLE `b_seo_adv_autolog`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_seo_adv_banner`
--
ALTER TABLE `b_seo_adv_banner`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_seo_adv_campaign`
--
ALTER TABLE `b_seo_adv_campaign`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_seo_adv_group`
--
ALTER TABLE `b_seo_adv_group`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_seo_adv_log`
--
ALTER TABLE `b_seo_adv_log`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_seo_adv_order`
--
ALTER TABLE `b_seo_adv_order`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_seo_adv_region`
--
ALTER TABLE `b_seo_adv_region`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_seo_keywords`
--
ALTER TABLE `b_seo_keywords`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_seo_search_engine`
--
ALTER TABLE `b_seo_search_engine`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `b_seo_service_log`
--
ALTER TABLE `b_seo_service_log`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_seo_service_rtg_queue`
--
ALTER TABLE `b_seo_service_rtg_queue`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_seo_sitemap`
--
ALTER TABLE `b_seo_sitemap`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_seo_sitemap_entity`
--
ALTER TABLE `b_seo_sitemap_entity`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_seo_sitemap_iblock`
--
ALTER TABLE `b_seo_sitemap_iblock`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_seo_sitemap_runtime`
--
ALTER TABLE `b_seo_sitemap_runtime`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_seo_yandex_direct_stat`
--
ALTER TABLE `b_seo_yandex_direct_stat`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_short_uri`
--
ALTER TABLE `b_short_uri`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_site_template`
--
ALTER TABLE `b_site_template`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `b_smile`
--
ALTER TABLE `b_smile`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT для таблицы `b_smile_lang`
--
ALTER TABLE `b_smile_lang`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT для таблицы `b_smile_set`
--
ALTER TABLE `b_smile_set`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `b_socialservices_ap`
--
ALTER TABLE `b_socialservices_ap`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_socialservices_contact`
--
ALTER TABLE `b_socialservices_contact`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_socialservices_contact_connect`
--
ALTER TABLE `b_socialservices_contact_connect`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_socialservices_message`
--
ALTER TABLE `b_socialservices_message`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_socialservices_user`
--
ALTER TABLE `b_socialservices_user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_socialservices_user_link`
--
ALTER TABLE `b_socialservices_user_link`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_sticker`
--
ALTER TABLE `b_sticker`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_task`
--
ALTER TABLE `b_task`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT для таблицы `b_urlpreview_metadata`
--
ALTER TABLE `b_urlpreview_metadata`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_urlpreview_route`
--
ALTER TABLE `b_urlpreview_route`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_user`
--
ALTER TABLE `b_user`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `b_user_field`
--
ALTER TABLE `b_user_field`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_user_field_confirm`
--
ALTER TABLE `b_user_field_confirm`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_user_field_enum`
--
ALTER TABLE `b_user_field_enum`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_user_hit_auth`
--
ALTER TABLE `b_user_hit_auth`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `b_user_option`
--
ALTER TABLE `b_user_option`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;
--
-- AUTO_INCREMENT для таблицы `b_user_stored_auth`
--
ALTER TABLE `b_user_stored_auth`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;