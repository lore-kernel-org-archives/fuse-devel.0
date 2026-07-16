Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61812F83A2
	for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 18:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784226719; cv=none; b=UiECq/KHNi77mUbbay8TwSF9vwAMRxvb8aa03Ak7XKCjKBl0bsQ2/RaId9MN1/toRGsr9qWb5Bg+T4JkWQt8CQOxF7l+kalMGWOW5Xh0bKZ2z8jIfkK6Sg0ihYYN6nwnJKaOCpjJAwpOYcspST84CBZdjTfG8/1JlWH2/Bx5MAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784226719; c=relaxed/simple;
	bh=A+D+l40KghlxKXVxZ1eUn0pVkHKTIx0P0dhTmffTwO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=COVX2PtqU2FXHmyBw/GEJM6d/SL+HkEqjz/ccmH25Sgw79MMlav/SXrWS3h6zud+o9WMlvmIh5e8wKibkUPjC++KLVb+KWFaool0Lf//8Go0HD/tWpW2g3DdrtZh0Yl65TIA6f1DVsVQY4GndLTlnyUDkLTKNuquejwct4IYkEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UapRhGJD; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UapRhGJD"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7e9f1f24cbcso543562a34.0
        for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 11:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784226717; x=1784831517; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JnznsT9MIdQ3sykkIjWP8w/k14fWjvtR/zQR8JlDv3s=;
        b=UapRhGJD4QS6nfdWX2hyjIHaM0VCZ8xgnD7LPKF23RyugZLVWHa4+5LX/UXWMvDd51
         s0PArVFkmP24yjXIQJHj3cVdModgGMmPXdLzEDQ9WrGxZGFHTBZb+UyVnlwBhNQwnnK0
         swcRpM2aEEo6czlSgJ7GgyvgvJO6bvaG5nvQcliMh97T0/9iA2rmhiKx7hRloOs7Czc+
         todk/HIuap5ooM3R/daBpeVY+W+6vW0yU0YCe6t/S0ALbsFXLYxfWMShYP8oBEs6AQa+
         MI8RLrSaIV5q7UZDroQlM9bJ2O8tKYrdCKPhwR0FUQ96ibkUn8h1wCteMkhZ0sy1zZpO
         X0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784226717; x=1784831517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JnznsT9MIdQ3sykkIjWP8w/k14fWjvtR/zQR8JlDv3s=;
        b=MqtHkwcMWRWC/TTtPrsFfovtjK5cDl1tpeU7rFBGjrTUO5YASL1r7xe+ELdYtywdI1
         W/Uj0yBzzqW2UraBSU7MNh6cnO2Nf83vHLOL1Mf/tg6zp8+cXXUhD3oEakWrIF+XKok6
         7r1XM6R5JU0FdKDGV2JpYFW1965cXfuR2qk/VZFPHt0xhxKjbc3Qw5yA0soN6T5TvzEo
         Gbn25XPlamAoTVWo0i6rUuyMeHue/oTz8x3Q3fuHxWSxVbAMtVRZ6+Ws1WA/83TqHQpm
         eA0dXcqweYJCuMZPM7wFT9bKDmfXSXpieuyZkCMcJMOZqn3Ykl+waNBBUZRaCB7eVT6s
         mgPQ==
X-Gm-Message-State: AOJu0YyqJdOcRHmO5kJkdZgg5ipPghR4OThBM79jWX1bJs15XsRz0pw3
	IMllTelZueg2CKQJW2R41RzTuhJTLx+aA930lY0bDuc/2sSgbyQN/qlJEo0USg==
X-Gm-Gg: AfdE7ckyfstrHikhSCYiNThheNfkohHey5lIyxFKkmTHe+sxva03CkaanEe93EMH5mK
	VnCihonJXLBC1fwAYIRTuuYzhuVUwUgYHRkwIBXebW5Y+UcCODtznXhhcxILmn9dmIbrDyzLQ5F
	zKHHn6DFfwUGdyZmHqspW1w/SP8A8aeAs4ILWAWNR4qOttgiiqYOotfUmbdRYYkXiUHfR15N3my
	1M9zpiF3fhGaXF7E1xWQZTSSDzq+PnrZ1N3OPsicTIP5nPa6gmA6HiEKImfihfxclnoa8EhUeP1
	o3gSpmfszSIZ6ydsgczBVLFsvAWcTz+/Jjc7Cus8XClOvb1xqLWynibBaMeqf+/03SNPjeAPFsd
	KNnv9AJsoGfTOdZ/YJIYH9+XGlBIp/wAfrNaGzrTl6zWPmSsr0SSmqwDo2C9naBZEFSrW7iLJZG
	EZJByYvM5gu5Bv1psqS+A1GOV/FlJbnzrtCKx01Irtvbe0GtEUkmrNAA==
X-Received: by 2002:a05:6830:6d91:b0:7d7:fd71:f2d4 with SMTP id 46e09a7af769-7ec6e583c19mr1791178a34.3.1784226716606;
        Thu, 16 Jul 2026 11:31:56 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:49::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcb262ddfsm20053236a34.14.2026.07.16.11.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 11:31:55 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu,
	bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev
Subject: [PATCH v3 0/3]  fuse: fix missing barriers in io-uring init
Date: Thu, 16 Jul 2026 11:31:41 -0700
Message-ID: <20260716183144.2710480-1-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are pre-existing issues Sashiko reported [1] on the fuse zerocopy
series.

[1] https://sashiko.dev/#/patchset/20260630211436.2062816-1-joannelkoong%40gmail.com

Changelog
---------
v2: https://lore.kernel.org/fuse-devel/20260715174305.336261-1-joannelkoong@gmail.com/
* Add Bernd's reviewed-bys
* Move deletion of unnecessary smp_rmb() in fuse_get_req from 2nd patch to 1st patch (Bernd)
* Add READ_ONCE for uniformity per Bernd's preference

v1: https://lore.kernel.org/fuse-devel/20260713175345.2542331-1-joannelkoong@gmail.com/
* Fix some other pre-existing issues Sashiko found in response to v1
* Add patch for using releasing/acquire for fch->initialized to make things

Joanne Koong (3):
  fuse: fix missing barrier when checking io-uring readiness
  fuse: use release/acquire for fch->initialized
  fuse: publish io-uring queues with release semantics

 fs/fuse/cuse.c      |  3 ++-
 fs/fuse/dev.c       | 17 +++++++++--------
 fs/fuse/dev_uring.c | 24 ++++++++++++++----------
 3 files changed, 25 insertions(+), 19 deletions(-)

-- 
2.52.0

