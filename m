Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43D246982F
	for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 19:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790104066; cv=fail; b=Hy7v9GCKB7HwOeAMGqVH4E8HjTCm43wB5NanB9Nw4usLtBcMYFfdUn2Xb28PAelUwWaYe8gJmSi9ja39GvAMCjupqudfgj+/YoKUHpvvK3AgkMorxVxnsCbM2fv/GcLj6HHlWvDEFlMr8zZckdunoAN+v3n4E/8p90noGI+mfhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790104066; c=relaxed/simple;
	bh=nfppBKlnt1w5V+ejhDS4qqcFFyUvE9TfmgbAMyrB3Bc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TgW4ir3h7jsUCs/Pw71L6rHTeatQU5p9DvU0qP6NCPg2Iupc2NrxKBqEPVVymVZiv+MPLiuhAiOuM1dgy8Tw0HFVPYFrB0AMJs3muW0rXBhhER06mUCv+yJUW3OXNrlgSarPOFY2P76KYt3PJNEeK0fudCArS8fbNkWk22rtvaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZiAEvI3q; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZiAEvI3q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790104064; x=1821640064;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=nfppBKlnt1w5V+ejhDS4qqcFFyUvE9TfmgbAMyrB3Bc=;
  b=ZiAEvI3qk1MvkxErLSsGXpE54aXMHa3FRfoWJngo/NDRMSNq4yULsp0b
   +GuQrHSVjJOn9A8WClRpGfxndAMobsJ7+Y9mLzs2dwNZNNn4SGkMSvmx+
   v6P/Kbwb6Kr+3tRLf0W/ETLE2ZRFdEUo/H0aC1mAHS8RyZw7TQkf2S9DW
   GnnUHUcOAey9EZqAk9xAgjdRiT2yLHH0JUpOzlbnWuUcCkPjWH54TR7sB
   U/6qPikGYZ62JUhu5wM+/rHsmEhh/Lg5dYfsVazyCz3Sayts7QoX9RmFV
   suTig9vn77g3q7t7kzPnBmjhvV6AK4AaClj8qGbb8jm76C4MgrDfOyvRr
   Q==;
X-CSE-ConnectionGUID: Se3rdtq+Scyohr3uJXEpkA==
X-CSE-MsgGUID: BycJnBFpTeW9Sj6nIDYffw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="101328822"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="101328822"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 12:07:43 -0700
X-CSE-ConnectionGUID: Dgn8+MXnT+iLqB9YzCEg/A==
X-CSE-MsgGUID: j3AlzXmOQ3KK2sAaoahRvA==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 12:07:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 12:07:42 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 12:07:42 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.20) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 12:07:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rYkz0ES2nrfhVTVUZZ18MSm7wvVm3IIZA4GqWzbRlHoIi4F2fYO7DWb8T8R1Uoe03XOiAnTqQoqWcSLR8jkk2+6IqhVmyVVG0NVYAvnU1n5Yme1RCWh/1Dw8nOl7DJgBO3vLguR2V49o/zRke1wKqZTKD+BTzUZDNZIpPkAsLZK1M5xNcmoFz/WFBIFKK0hB0xkKkG88+9t6S/TEOE9Mdc1Rk6OkhJYSqfSoLM2PJbsLTrys+2s8cH8uEiE2bOZRa6uaWnkCRk/5sKijfKiJfMWVP4zjCKo6kI8VrBzDjOkBisXyIq3odWu7xIS/YcHeEjuhsXydNPQiDoApHNFHXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1IiiXvZBcKPvz3ekvg28NVQloF64GahvbXK5McoltQY=;
 b=KVTh2viyLsNGrkhnMMTRSKg8jRgj3GixuNnHWhMmFX7tTKpcPDjpn+giKMw/LR4hfN6nEIWl/TCFgJAIpK8f7hwNJ7IJnts602sFe/1gsyew4Xce3aI+uou8AGDI1PvVLoA3w0z2nU9x4S4thf726xRZpQ279UPojDw8Wv0fn5udfqflX1KZAxK6qn0BRyS2of67s0FdtxMdGXTBiin0IKfjsSXxleOkfTmrjT1jQu/DzkH7NOh/E3G5dbutZUDAwMtXi3r4id4Ai8LPDMoMgTVEfB3eXLbp1fBFySetiancm4+5VVuXQmRc1s95qDcCub33Fs6LcEw403MGWDKcnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF0BAC23327.namprd11.prod.outlook.com (2603:10b6:f:fc02::9)
 by IA1PR11MB7856.namprd11.prod.outlook.com (2603:10b6:208:3f5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Tue, 22 Sep
 2026 19:07:27 +0000
Received: from DS4PPF0BAC23327.namprd11.prod.outlook.com
 ([fe80::e721:90d7:9214:2d53]) by DS4PPF0BAC23327.namprd11.prod.outlook.com
 ([fe80::e721:90d7:9214:2d53%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 19:07:27 +0000
Date: Tue, 22 Sep 2026 12:07:15 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
CC: <fuse-devel@lists.linux.dev>, John Groves <John@groves.net>, "Amir
 Goldstein" <amir73il@gmail.com>, "Darrick J . Wong" <djwong@kernel.org>,
	"Dave Jiang" <dave.jiang@intel.com>
Subject: Re: [PATCH 01/11] dax: replace exported dax_dev_get() with
 non-allocating dax_dev_find()
Message-ID: <arLR49IEKWd3ioMs@aschofie-mobl2.lan>
References: <20260922061019.3320196-1-mszeredi@redhat.com>
 <20260922061019.3320196-2-mszeredi@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260922061019.3320196-2-mszeredi@redhat.com>
X-ClientProxiedBy: SJ0PR05CA0155.namprd05.prod.outlook.com
 (2603:10b6:a03:339::10) To DS4PPF0BAC23327.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::9)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF0BAC23327:EE_|IA1PR11MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: 18b5918a-28a2-416c-f1fc-08df18dcbe16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|4143699003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: cF09r4HBmJT+KGyCNt9mojxs5okDjNbuijovzkKv4iTtewijFjsq4nrbkKIC4xcdF8RsXoa+lhAJcYlrXOUwVxc4BH1aldTD5gUJ5J+PXKHctOkUn0BNja/8mvP4P+4YVwJXD3GW1nNLQjjCbxH7inW/OMtTWStnj+eXEjxR6/gThISr98mzVvujpP0j08W1mQThdAoBqsgm9KNDcJPXhaBVvZjfDgbflhyEBmHSgVR4rAedetCzlm0whSYbDnKOAD923/q2M/5yx6mwr/oguZvPEdeq4yKyXm2xVwujzOnlY1wPgTryTHymOJWnzCTsvZRnNCg+F4H0ZDCtvl7oweGhG2xP/BAwwdXyPQSlDLGj0iGsaS20fdKdyeDT31fJ86FvIh1im0/ATN6aSwBQaKKtTmGTjQS833pv/5NeVB0zz648lonFuuPdpST0Niz+l0QlVIM183pV9pkh44W8BZ+JhBYHWEuxhIFSeoQRzc8XsBs2sqNq/C4Olgg3YwwTCiH1PV9nBrwDwZd9sJd2MvaoUSA+tvzOuU6KLEaoc5mVXaJT0vbpbqU8mt/4uwK6DUmo1j81YrNjA3zpSkIMUSYr1M47/P6F3abhF2vpP1Erhn/NacnDGA+ovpGRgm3Bksqjf5MebIASOm6Wa0YLzbmdJ/yiXspkl3olaVuzZRU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF0BAC23327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VsY6iJ8G8FRPo8vV5/fFNCn6FlqKrRjGo8R3taPwYpzTnW+DK9UnPPfh0O8F?=
 =?us-ascii?Q?QYa8VwPulv/WoAix7KgxcfdjHvJwZ4sHk0AoNSvJik3IXIjXk631GqDzV/3i?=
 =?us-ascii?Q?bQKe2SnsBa7MtKSEB3x9rMiCHw7g2bbUpeIFGX428vAMc0SjzJeuzPPQoZ3t?=
 =?us-ascii?Q?YKQ+RkDUex4JqknDt26J5xZO5yVYfhD6zs9bfifDHgz+88TWs00RYL340Nxn?=
 =?us-ascii?Q?0EIViBLz/pBgALSHratHPe4KjhhvxvYL2ymvrmuIPScfwyzQeK/b6OjnBVdA?=
 =?us-ascii?Q?cgCEomDelzj20/gcmGCTpSyVHyGb/zDFVZomltI5OzA65qt36D/asvy56MbK?=
 =?us-ascii?Q?VBv8zFtv3FtR/Blybsl0odd4zxsP/Zpw5P7+0478u2gUU76m6tQVUrXpUN4N?=
 =?us-ascii?Q?W3+jyTvb3R+7ubNZhlb4DjOzte4h5isdBv6dFNmdIdZlRmo+BhUwLV4kbL5g?=
 =?us-ascii?Q?oB12RUFjWKV2Zzpda6C6UhQfh3k+r/yVDitfBu+sDYiMWwI9YDFaLzipdyRg?=
 =?us-ascii?Q?CSQsvtNcSBd43srPPTarVR6xxJOgs7RZoZisYckwGylMKL84HdOOyL1SjKNH?=
 =?us-ascii?Q?/g+GtwrMFiCJB/gjvOrWjuVnDLIKzWfkkOKfob1DifqaPH5KA6PsuzWAUrB8?=
 =?us-ascii?Q?xHDcglkMDjxE8nJIpdhP/rmj5RMoJFmyZf5r1MpsGH7Mh3tFy1hoZTyhHgVt?=
 =?us-ascii?Q?hmknTTAoUzfjEg88HSAs3sGjNTUZfaBroBHL4CsyaajhVFXOAJD2fgdW9q/V?=
 =?us-ascii?Q?6dRc3ZAT0DgqxcZ3GnJWVunE+R79Ajw0kOuMEnjq8nP0duQkqFTDRbw7rv82?=
 =?us-ascii?Q?SiFTE5hiCSIBrNtEGajrWMhaGr5XVIAz54Buo8hU9+FOq5/ojN2uBLHR083q?=
 =?us-ascii?Q?+Le2wGukU+Ct/dMT6zz1JVZOoTo9xh7W0+Ne97OkPxnw7zkJTQX4F/tFbbmM?=
 =?us-ascii?Q?agKH5DmbygCWQwBiq0z4SIT2NA9VEfiymXN/6M/wsZZiiXbqi3PExt12CpnR?=
 =?us-ascii?Q?DDH8AE0rOuGxNT6zSDZSs3JM2CPoL5leadx0TI+B7kzx6AUZ+2lidZPKSTMR?=
 =?us-ascii?Q?v+yJ0e1ajtk8HaK9NLzmuuP1SRb/bHng9ntEXUORxGMuKZ79oBTGdWIS1qnQ?=
 =?us-ascii?Q?pnZhZwJCWaCqc05nuUvWDkcc9O7pFlRKIsOee1756nkhhXqmCi0jl/QjIjb9?=
 =?us-ascii?Q?f1oSl+AnCaRdG225yiULPydP99rR9i8qrHX9/toKSX7655PHzUyBkrQfuYvu?=
 =?us-ascii?Q?7tK4QiQGI4Hu/5NC5fVYqrjm1+5CJKU8OUdNMu4A/tZUaXmRv/e1AZ5NTBsY?=
 =?us-ascii?Q?iCHeP/cRYCwe83NYHwMFxwih+SN+DA5jv3K3lE2DWwper8MrffIkG6rELKJT?=
 =?us-ascii?Q?vBuFeQSfB50ZXLKSGkcssIkXf+mBiJEI46UJaNplKJaYLMlwkVefGEgX5KIs?=
 =?us-ascii?Q?ACn6h3VUc14QNy32nqi1+xsQb678gHuHqmKX4elG0jiJBQdFSxBYw1XG8gpe?=
 =?us-ascii?Q?AuA0GxZaxZ6OcpBt/m3TMYuRPaAM9FFcKmWGBJrRh0y3hcM4znjQxmtRJBk1?=
 =?us-ascii?Q?dAqZN9AYLjbvgQAuRrEU8EuYWV84uzxcIP4bUL/90R5JkQXPJuBIroPHzd29?=
 =?us-ascii?Q?YsS3ygZebvxCXvuMXV7+DPMPuX5uiY6SOZCxHZzIg2jZU+wxBLlG8lLjHnGD?=
 =?us-ascii?Q?JfeTIEdNVhL9aEYXvcIxexDjth+aRyqmTqrK8UcpnEGkVgYM32mfPDNqh1ib?=
 =?us-ascii?Q?fTLPnKG7eRK/uzK9PSki6IpYyNj6J2I=3D?=
X-Exchange-RoutingPolicyChecked: r/M35oCTVsU8kXFCM4CGH3MuOv1n+Jb+QIE9RxLFfiWy+TvfF+jUYVT6fuxE31NxLNZpBwCdBIxuT7Et0573Rcyv2egsFqi0EWFRjp2vyp1qEmLYiCTepI0BV00LBgEYlnGiqjGousFhkoKLbr+wYyx/SrxMk37F/1eJUNxvO/wIl+6a6x+CX+VpxoO4J2h4MXTlCgY1IZBaHbKqlm+iIG/lt8nimFVaNBqVBaWl8LkIct7EOJcu0D9ZS6uaHKIl6FZ36UlxFSEcSh2bOjA/Q2WjGanf5X0Hb3wK4oYnXFK7mNncI1J7FnfVSNb9ZXgdSguVHfZKQ6yd/x3tkimlzw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b5918a-28a2-416c-f1fc-08df18dcbe16
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF0BAC23327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 19:07:27.2905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hv24f0Vt5dBAiF7EuOxWy2g4MmipRxxGvyfFJHtEYCJWm4MFpihBHcoxHOHQ3LweM/YIIcEjY2WLdbHhksxuyu0xuOImOFvarm7Hh0Jt1sE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7856
X-OriginatorOrg: intel.com

On Tue, Sep 22, 2026 at 08:10:01AM +0200, Miklos Szeredi wrote:
> From: John Groves <John@Groves.net>
> 
> This fix is in response to a Sashiko review, and some subsequent
> analysis.
> 
> dax_dev_get() uses iget5_locked() which creates a new inode if no
> matching one exists. This is correct for the internal caller
> (alloc_dax), but dangerous for external callers that look up devices
> from user-supplied or metadata-supplied dev_t values:
> 
> 1. A new inode is created with DAXDEV_ALIVE set but no backing driver,
>    no ops, and no IDA-allocated minor number.
> 
> 2. On teardown, dax_destroy_inode() warns because kill_dax() was never
>    called, and dax_free_inode() calls ida_free() for a minor that was
>    never ida_alloc'd -- potentially freeing the minor of a real device.
> 
> Add dax_dev_find() which uses ilookup5() for lookup-only semantics:
> it returns an existing dax_device with an elevated inode reference, or
> NULL if no device with the given dev_t exists. It never creates inodes.
> A dax_alive() check under dax_read_lock() guards against returning a
> device that is concurrently being torn down by kill_dax().
> 
> Make dax_dev_get() static again (internal to super.c for alloc_dax),
> export dax_dev_find() instead, and update the two external callers
> (famfs_inode.c, famfs.c). Also add the missing CONFIG_DAX=n stub.
> 
> About the 'fixes' tag: this removes the export of dax_dev_get(),
> which was flawed, and replaces is with dax_dev_find(). It feels like
> the fixes tag makes sense for correcting an ABI error.
> 
> Fixes: 2ae624d5a555d ("dax: export dax_dev_get()")
> Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> Reviewed-by: Alison Schofield <alison.schofield@intel.com>
> Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
> Signed-off-by: John Groves <john@groves.net>
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>

A couple of process things
- use get_maintainers to send this patch to the correct folks, including
  the correct mailing list, nvdimm.
- those folks and the nvdimm list should be included for the entire
  series so reviewers of this one patch can see what this is a part of.

So what is the thinking today?  Will the person who merges this
fuse-devel list work include the DAX patch in the pull request or should
I (as the dax/bus patch wrangler) plan to apply this patch?

FWIW, we looked at this patch last merge window and decided to
wait for fuse to land before making further changes to DAX for FUSE.

-- Alison


  



> ---
>  drivers/dax/super.c | 38 ++++++++++++++++++++++++++++++++++++--
>  include/linux/dax.h |  6 +++++-
>  2 files changed, 41 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dax/super.c b/drivers/dax/super.c
> index 45f84b0eb909..824e1f6df378 100644
> --- a/drivers/dax/super.c
> +++ b/drivers/dax/super.c
> @@ -565,7 +565,7 @@ static int dax_set(struct inode *inode, void *data)
>  	return 0;
>  }
>  
> -struct dax_device *dax_dev_get(dev_t devt)
> +static struct dax_device *dax_dev_get(dev_t devt)
>  {
>  	struct dax_device *dax_dev;
>  	struct inode *inode;
> @@ -588,7 +588,41 @@ struct dax_device *dax_dev_get(dev_t devt)
>  
>  	return dax_dev;
>  }
> -EXPORT_SYMBOL_GPL(dax_dev_get);
> +
> +/**
> + * dax_dev_find - look up an existing dax_device by dev_t
> + * @devt: the device number to find
> + *
> + * Returns a dax_device with an elevated inode reference, or NULL if no
> + * device with the given dev_t exists. Unlike dax_dev_get(), this never
> + * allocates a new inode -- it is safe for external callers that are looking
> + * up devices from user-supplied or metadata-supplied dev_t values.
> + *
> + * Caller must put_dax() the returned device when done.
> + */
> +struct dax_device *dax_dev_find(dev_t devt)
> +{
> +	struct dax_device *dax_dev;
> +	struct inode *inode;
> +	int id;
> +
> +	inode = ilookup5(dax_superblock, hash_32(devt + DAXFS_MAGIC, 31),
> +			 dax_test, &devt);
> +	if (!inode)
> +		return NULL;
> +
> +	dax_dev = to_dax_dev(inode);
> +	id = dax_read_lock();
> +	if (!dax_alive(dax_dev)) {
> +		dax_read_unlock(id);
> +		iput(inode);
> +		return NULL;
> +	}
> +	dax_read_unlock(id);
> +
> +	return dax_dev;
> +}
> +EXPORT_SYMBOL_GPL(dax_dev_find);
>  
>  struct dax_device *alloc_dax(void *private, const struct dax_operations *ops)
>  {
> diff --git a/include/linux/dax.h b/include/linux/dax.h
> index fe6c3ded1b50..29113eb95e72 100644
> --- a/include/linux/dax.h
> +++ b/include/linux/dax.h
> @@ -54,7 +54,7 @@ struct dax_device *alloc_dax(void *private, const struct dax_operations *ops);
>  void *dax_holder(struct dax_device *dax_dev);
>  void put_dax(struct dax_device *dax_dev);
>  void kill_dax(struct dax_device *dax_dev);
> -struct dax_device *dax_dev_get(dev_t devt);
> +struct dax_device *dax_dev_find(dev_t devt);
>  void dax_write_cache(struct dax_device *dax_dev, bool wc);
>  bool dax_write_cache_enabled(struct dax_device *dax_dev);
>  bool dax_synchronous(struct dax_device *dax_dev);
> @@ -92,6 +92,10 @@ static inline void put_dax(struct dax_device *dax_dev)
>  static inline void kill_dax(struct dax_device *dax_dev)
>  {
>  }
> +static inline struct dax_device *dax_dev_find(dev_t devt)
> +{
> +	return NULL;
> +}
>  static inline void dax_write_cache(struct dax_device *dax_dev, bool wc)
>  {
>  }
> -- 
> 2.54.0
> 
