Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F4F44470E
	for <fuse-devel@lists.linux.dev>; Mon, 17 Aug 2026 15:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786979909; cv=none; b=ADtjXpjeJ5Id3B0Gk5IF60PQHUmz1cIUos8EcZcOsIfYLdPwxoHzH7PzTTxuwXC1pmop/99pCxBG6xorQaOupXGqglDPqGRPaWEHuD6KHWO5YHh14vHT195CMBXw1P832SxqGH1HmEB0X98r8VzoXwIjYRai3X7FLhiy9li3oj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786979909; c=relaxed/simple;
	bh=HUfXojDODJax+GNmGO+ENINeQ+6j8w8pEE8BrSbIcDs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=N0z3UobcvB83wwYFlIvGb+pU57NdTXdPowIiu/4Gej/GREtzIxQbJI6zOccHGZaO+QlYdXxrELoH6zwacgpiyLjB+MQIRQDm2O2s47OD2KexfnN2oictWPsUeQjxFf71EnOdZUSa2sr1ZaRJ70GOUtQGOOl1HwFPv+qWaEjiFGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=NIow6mXT; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="NIow6mXT"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1786979900; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=3Qt97fzLI4Ua+l4IKyanQGt75jaD2Cp2qOduyMrgQv0=;
	b=NIow6mXT7tcuxLdxmA+rk4q3nw7kZgP219jprVheO11w4HOzfa2r9Dq09Lp8cM4HsUrSLssIyJ+KkG5GOKbpGI5Z+JQ1uEzt7OwwLqpqaUdUaNNK/CMYOpUvXvLlY5XUs0qD8hge3Qsx2fPeQv6m0g+BStcWuEpGQOQT/xt1Q9k=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=libaokun@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0X9A6o5H_1786979881;
Received: from x31h02109.sqa.na131.tbsite.net(mailfrom:libaokun@linux.alibaba.com fp:SMTPD_---0X9A6o5H_1786979881 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 17 Aug 2026 23:18:19 +0800
From: Baokun Li <libaokun@linux.alibaba.com>
To: fuse-devel@lists.linux.dev
Cc: miklos@szeredi.hu,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vgoyal@redhat.com,
	jefflexu@linux.alibaba.com
Subject: [PATCH 0/2] fuse: fix invalidate lock leaks on DAX truncate error paths
Date: Mon, 17 Aug 2026 23:17:59 +0800
Message-ID: <20260817151801.2677899-1-libaokun@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Baokun Li (2):
  fuse: fix invalidate lock leak on setattr writeback failure
  fuse: fix invalidate lock leak on open O_TRUNC DAX failure

 fs/fuse/dir.c  | 9 ++++-----
 fs/fuse/file.c | 4 ++--
 2 files changed, 6 insertions(+), 7 deletions(-)

-- 
2.43.7

