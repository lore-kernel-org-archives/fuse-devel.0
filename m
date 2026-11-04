Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797310;
	b=lZE8ukQzAI1aSDHeszQikazegY5yM451yyDbDYRgDwQKyU5XuPtzp9d/VFLVEt58e1PE
	 BNpFrwM0z1xCKKDaGZlB0ZgUrOvGzgr4MuFnunbLZquWH07uGQ/x3zhr7Av7/gYV+e8aR
	 B1PMWKHlZ9SEDejApPhxrhJAZUurbtPuIdi91WMWuFjpkPh7aIbglaBTznqsWXJmhW8Zg
	 XCz/+RdklA9rwFnkRgOH+D5fuYzMVQb+xaxunTcV5CL2ovB5QI0/0hDd3Cgp0X4wYnCBz
	 5nKZeqcN2PMNxnA+ZTS7kiFdSFtkGJoiNk8IokRbxyqE4vCBKpLSXiDj1p2e7fsa4Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797310;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=I5JDyfdMkj2wCtOOfN649rnZ+9k1JAyMoYfLCV4c9D0=;
	b=M+Usd+RhoyjWU018dDPP8KCrodhZjCOqnyA7a8qCfcz3dPXbn6P/mrnXvkEQoFKKa1jY
	 tKwN4Il2OLk3hkcjAvBNV6sbSvLNdaEXXoFjNbTsImCh+yPBmh4/OPyjD7jbuJtURHZ1v
	 HzYhTuGVDsCefol5sNeeVs0xUhcHUBZ0E309ZYrbdPE9S8HB8M0/rmAeyG5qRRFKbKtTF
	 kkjDzDQKALHsrhbGUVxtIOCOend072T0Z3BiDv2WuuJlRV/uz/JaNN+pmWK/P25A/R6GH
	 fx2NG8ZTpLHm+25pduD5c+pRWDD5XrFgUeUZQe/0X+SVlyJuu5uveM32AMDTM+NxCeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Faz3ZjK2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2094606A330;
	Wed,  4 Nov 2026 13:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Faz3ZjK2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 375651F0093A;
	Wed,  4 Nov 2026 13:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793797309;
	bh=I5JDyfdMkj2wCtOOfN649rnZ+9k1JAyMoYfLCV4c9D0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Faz3ZjK2Csai2VwqGdu5cZgm1R7gHNhAOvUatxXst7kNVDGJtMEIlR04nRTkJw00o
	 J93jsV1xz5rOv0TmN56RwnDBl2DAjjL1JGlbXV38vGVlt+uGI9bO0ags6GCgIbPIdj
	 LC9efBKf7oBCiaEcae2u1IyA+KpVgXJA5vWw9vBiFBtNBtNSwXFSNqXjYc8JkYTAQV
	 fKmejEOKaozskhfLf044dCXODEMfKizop4ijrC9HXIMmUphSa4ijQYYdacyGAvdtev
	 AP9I8ZusXEp1DjbEm1Iagq1oz/0kKnPNjp3hG6xjCnDyXsraG+HVTxX+kbEU6aSaJ/
	 0b8BFmpDKpBJQ==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.ams.internal (Postfix) with ESMTP id 11C551980054;
	Wed,  4 Nov 2026 08:01:40 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 04 Nov 2026 08:01:44 -0500
X-ME-Sender: <xms:tCzrasLnQ-6aoTAivy6dIwb3QAXiDgsOwkB7XNibpfHeE300IgzEIQ>
    <xme:tCzrahYN1w4j905SN3NhF4jplVsHNsXUlUc5JnqlrL7nOXX3rrLDNn6YZPutix5ri
    D1SJErl3C5VDQDAvUmssApnUGf7L3krnoy3BZsPIouzDdrEB0m8L6k>
X-ME-Received: <xmr:tCzravWl5s_fXCNZi1Y-t1CAFz9SGWtnNx5qTk_tp0POGVoUrk2uCd8vxAI>
X-ME-Proxy-Cause: dmFkZTGcnWxWNdwzviArTqwO8SleswujEAoF3G5cAnzgWuj9VIXYzVn8L/YtSSoCVpDQCx
    AFAjkaMBKJDECegKseyQPi3BoJ2ULdzgEWHQh0kOOdV3qcZ96T5qYw8zvnYBduU6y+7gOl
    ju1hRqdfaUd029Zpq0M1QKVfvNYpVJXA03mIXM/FVYF2n1TVZdGxcwDBil6kVRafbiJtv0
    QuPNDwYksKVrYzT4QGS7HIxmz8ayVgiPQk5G9zoQji1nSBMTr/zV+0QH6w0a9BT4L54N+d
    cRhB7KhKgiZgmWNJc1G8l9d+gvjQ75B75nEIsy2loqzEXGvtqjUcmfJ5UhZu2fDzNX4RJx
    MXTgBiPaExnSeSGdTd2uIQPIf04/vV8GeZZGlCpJD3MJZYqa3/ilpSwupO/6D8DuMuVdgf
    lRhydXCQ6Xa2S+8DXLnkhoRuc1AjZzapOvhFIm7zq8MW9dqCj5VxcPf4OCv5NvmFJ7UYZ2
    W5KDa8ES6KsPHniHYnWGGUwJ2J4K/1PV1PHsiPmmHvenRB0ZPoybQ89E0SeGb9bommOpqP
    nH7w/zl3rKWJgnqBtibtcvEVgCGNRaGZi5A1a5NqGqAreUQOZZ+flJMakBeKirePoTtvdm
    jmXr2MmwPG2xEc7XfTnFlMnp2TzDvQD9nw3/qiRcvcRcLHI9+hkvlT78GBIQ
X-ME-Proxy: <xmx:tCzrapHj8fNK7yMBcpF29XSoU7Co7uGuP-5XZ3IpQ9GIsIXoWSQu3w>
    <xmx:tCzrakC5Nm0lKtJYDGNGsLNIOv5n9mqZVigJ3V2aszFgd3UQ5JQEAw>
    <xmx:tCzrasVyFTfFltq4x2-saDnpvghTxCZn5zweaKj3fmmbIpygVzC22g>
    <xmx:tCzras4VW6TSobJGmtOJftnDT4qY_mRwirpxa-3AhBFeorfQ2rWlCg>
    <xmx:tCzralGiIlFvyC1gpv3jZPsZOa5eFtYPy0MBq-9V20rRKnakIHq6cEMm>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Nov 2026 08:01:40 -0500 (EST)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Hugh Dickins <hughd@google.com>,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Harry Yoo <harry@kernel.org>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Oscar Salvador <osalvador@suse.de>,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Pedro Falcato <pfalcato@suse.de>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	kernel-team@meta.com
Subject: [RFC PATCH v2 03/18] fuse: don't move a folio with PG_rcu_free into a fuse file
Date: Wed,  4 Nov 2026 13:00:59 +0000
Message-ID: <20261104130118.2507513-4-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104130118.2507513-1-kas@kernel.org>
References: <20261104130118.2507513-1-kas@kernel.org>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fuse_try_move_folio() takes the folio of a pipe buffer and puts it into
a fuse file, where writes change it.  A folio with PG_rcu_free may still
be copied by a lockless page cache read that found it before it left
the page cache.

Such a folio reaches fuse when a mapped file page is gifted with
vmsplice(SPLICE_F_GIFT) and its file is then truncated.
fuse_check_folio() refuses it only because the flag is not among those
it allows, and with a dump_page().

Copy such a folio instead, as fuse does whenever it cannot take one.

Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 fs/fuse/dev.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 4fec31fc0b84..526929c7b3f1 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -1152,6 +1152,10 @@ static int fuse_try_move_folio(struct fuse_copy_state *cs, struct folio **foliop
 
 	newfolio = page_folio(buf->page);
 
+	/* A lockless page cache read may still be copying from it */
+	if (folio_test_rcu_free(newfolio))
+		goto out_fallback_unlock;
+
 	folio_clear_uptodate(newfolio);
 	folio_clear_mappedtodisk(newfolio);
 
-- 
2.54.0

