Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9584334DC
	for <fuse-devel@lists.linux.dev>; Fri, 24 Jul 2026 10:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784890597; cv=none; b=Xc9AjQfscxUAwyY5EYuPu8s2ytM1e6uElQnwa8z2/0k1ipcxuZ3OQbTBrbv8PfJ8j/rttcL2sInS4aQ7f3UiD9zBHsQ4844MjodVeizRmpTe2dlzGTcGns9RetyUgHk4o+tb+v6Z7NKEcto2SLEywG6odLe2/7g5qhQUpKHnBzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784890597; c=relaxed/simple;
	bh=LXT7NNNk+34Izd9qSdNQEA2RQbvDma/pwEyY3eXxm34=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=biA6ziOvg1dmL4vIEgcVh7Ghbgc+FCFlTdeZhyk/9CKpHkNf8GKdrPHBdLLdytikT8qhZ6lkNcnp12xXcWtgP4q5FmwrxzxhtbzN0lDSl5snwuLyIznCsjc+kAdOq2WRhspDQZ51CCQ2glsOpktkL5RRSvF2sqFheu1T1lriCgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=XVarkj9r; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="XVarkj9r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1784890542;
	bh=eSyrYdYsNNjcKhQQMkW3HRfC4MP7/a6W+j97sU26vT0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=XVarkj9rAxv4lWT6saLXBa48J4T89mGSHiVZQHyqNnW8sBmSMTILQcuVpsvpAl3DP
	 3l0V4XW1xEnMRym8pfCuB3MV0oMZGICFAH1cMDpJQGiB7Gqbmk0rMynBNKTe2nP/Zr
	 CRdnLevQLJJFESSGG8puc9nPCISS1bWyRQ3se/7I=
X-QQ-mid: esmtpsz18t1784890537t3288a8b5
X-QQ-Originating-IP: O8m6gk5eqDi/vJBh7WyDI+ZuEQ7YiiI0D+fZiMy3ohQ=
Received: from uniontech.com ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 24 Jul 2026 18:55:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 18324042697375583971
EX-QQ-RecipientCnt: 7
From: Yichong Chen <chenyichong@uniontech.com>
To: amir73il@gmail.com
Cc: ndevos@redhat.com,
	ndevos@ibm.com,
	chenyichong@uniontech.com,
	fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	miklos@szeredi.hu
Subject: Re: [PATCH] fuse: skip destination updates for zero-byte copy
Date: Fri, 24 Jul 2026 18:55:34 +0800
Message-Id: <20260724105534.163297-1-chenyichong@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <CAOQ4uxjys+yENYgjROu3Ui-athFjdY0E4fGhR4qsb2ed04wqkw@mail.gmail.com>
References: <CAOQ4uxjys+yENYgjROu3Ui-athFjdY0E4fGhR4qsb2ed04wqkw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MKFQA+k1yb/24BOpQuw62PCJPMtsYOoYFcm9oQnOlOUKIrYtrLRRygjJ
	arKka5KzmiCoSLkr3n4T6cOazrloc1X2i8wpLkObxXyKek4WAU1AISuAizKsC11tMmKoYx0
	yIqkutQiEJRckvyWpk7lcxMB0PQeMcQcLnyP6EyiOdJ5hI6e81jMLuAhPC1lrCjZmN2lFeE
	2XExd8IEjBQ/3WPxMoiU/kGGtHQQ9t+reFA2e+Ye0Z1YbpXm8puP/1JNtpkZM96zYs+0nYG
	GHZcDHJv2CkH6jxYciJZkJrPCgxvN0W1UwxE7QyhIMQkH5C1FHWBmQtVWskUlQE6ot8rPEv
	p0KZ+aaqGNsmu25BsGXDVn/Q8meg1+44slxOocurbWfVnJgMeo+M4wbP+OYjlb2vI/ibgPW
	XxvO76fo54UPurPKnDhvtUTNUq3gOUG8JA/vlz4rWOszF1NHJNvJOozJgn8u0v4dxRvlPEg
	NntDfjVdP6fcsts5TF5xDZd1LMwSMdetEYrOsQJa/4EUR9w61h3MdzR2V0YBA2S7G/pahES
	ueP+1txDHrndFYb4KMG+hD+O+cfOf4Zx4fWIlM8m0dyKDEwS2p2hLZs4zCQypRE1p2VJmCU
	GqVMsCzgCyv5EkOq1rz1Vs+y6hJQw2wk2XLnsfbSCwslwlfen90NK5Z4QPcgnPvj/L2eCHi
	2WjkTgtGHA25wyfjbibL/wGzeJYt3nTdDM2ufB9iwZDfXNLcl+zGCLq4g7oGnkzMjjFkSkt
	ZTI/RIUEf9NIWQSuffAW19Vo0YDTW6nDlygi2hUcn2sdU24SWVhzhyd1qgGE1x9FOQMTCxv
	v5kbpxpVl81I7mrMpfE7rezYxviJXFWvwabdlx1Fn3OC70rzCyKcRHAQSb8FLTnG4NgjeIh
	yrX0KuMWLWpv+Qs2qbmqHGDg1CWYI0MU5qDSdOhXRrbudVpEgIGiSsxSj+EwdY95wLSxQ8P
	AbjYmJfFfA+MAIBUn8wy6pq9jOUBrKV0h+IWadSy62dllCg3eKpCmqW3hg24TnUfAdRWBKw
	4SFo/04YQjCTl0OWFNK916J2GC2EsAaVYI//c0RW2nNxpgJN6ecE9a7JbE9o82uasEHs7hB
	K/lTZ9bZAy+8yTgnrlep2c=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

Hi Amir,

Thanks for taking a look.

My concern is about the destination-side effects when the daemon returns a
zero-byte success.  In that case copy_file_range() returns 0 and no data has
been copied to the destination, so treating the destination as modified looks
wrong to me.

One visible effect is the timestamp update.  With writeback_cache enabled, I
can reproduce a non-zero-length FUSE_COPY_FILE_RANGE request for which the
daemon returns 0, and the kernel still sends utimens() for the destination.
This can make userspace tools such as sync, backup or build tools observe the
destination as modified even though no data was copied.  In many cases this
may only cause extra work, but it is still an observable metadata change for
a zero-byte result.

Another effect is the destination page-cache invalidation.  For a zero-byte
copy there is no copied range to invalidate, but the current range calculation
can still invalidate destination cache unnecessarily.  For example, when
pos_out is 0, the calculated range becomes
truncate_inode_pages_range(mapping, 0, -1), so it may invalidate the
destination mapping from the beginning.  This can cause extra FUSE read I/O
later.

I agree that the stale source size is a separate issue, but the current
destination updates do not fix that.  They operate on inode_out, so they do
not make inode_in's cached size consistent with the lower source file.

That said, my current patch is not complete because file_modified(file_out)
is called before the daemon reply is known and can already update the
destination timestamps.  I am doing a bit more testing around the zero-byte
case.  If you think this behavior is worth fixing, I can send a v2 with the
timestamp/cache update part corrected.

Thanks,
Yichong
