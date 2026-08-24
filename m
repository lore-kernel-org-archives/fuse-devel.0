Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9573F074A
	for <fuse-devel@lists.linux.dev>; Mon, 24 Aug 2026 09:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562360; cv=pass; b=tGW+RHyWpmorOuqEVXDaonyEsQL+egVDd71wEYlRtKH8dAKsetvNkJG3Wkvjwgs2NeHyfd3Ch5NoI4gBgUVOO8ddTcoszWCTMWDzA1ZB+eAwSZc5cNrzj9jE+Cci3xQglofetKejDS3lnGCRQhox92rHI43u9yVHJPeRDC4z5/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562360; c=relaxed/simple;
	bh=k1VcahloVqTMd2bS2EdontwtzK2WJK0zze95i6TSOFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JDi8qLm8WzK/Iziw9JQMZxXQs43JuxV9lvt9vxen3hYnyD5w/MxT5juW30Ur2hGvsSYbRcOwooRDq/DHdY9Qmy56C4RhBUlc8XZzSBYZZ00X/dHXu4B6VrAVWvZsqvY2GK1GGRIsnrq0jxsXfQNxhEspWizHo05DtJOxiND7xPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=pCmnOzLk; arc=pass smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="pCmnOzLk"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93695893ac1so185709185a.0
        for <fuse-devel@lists.linux.dev>; Mon, 24 Aug 2026 02:05:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787562358; cv=none;
        d=google.com; s=arc-20260327;
        b=c6PE8DzrOsXD9RKyK+oCmOiiTxwSNOInye1CLIhg48fYmcB2zkIEq6i2/1RYIwag2Q
         Gx18qGoXC2xKWoLVPr8Agx6Bveu9Gqw6wf0kUYNoFZTHWX2cDFEkBrRcKuK+CNhAghwd
         1jjN7zOmn2dImn57fuZMlDy718YPnUO86fk3jINkdrSYEMaBNEdmopTo/fciomaTBHos
         WD0yV+0PT+1rdXw5VopOPEye5UTkCkgQ877FWk6a4iaP3EbwHftC7+anTydPWeIZf6Xi
         okibp2Qu/KkObBwIPDWx362lMF10HM6UvYho6b5YfQhHrmXxOJaSfe4xLqMVJcaBWthH
         i+JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xjSchm007/sw+2JfMjG96f8T6RE12rgCCudebYixRu4=;
        fh=fXTX19y5by145YtfpBpmv7w5J8cqLRO4RjD54o38cUE=;
        b=nZ8gi17YmtDK3pC8LIQx+bVA3PGEoVj15fGFb1J3qIgtMfSNG9u8TfseLWwUGXXL+P
         CvRTNB5sC7VVrHU/Lc8+WbzXDJJiJMQ0Lv/Fb0CvIwtAhY44mVxxfiiS5gJ2kyc7hRbW
         TH5nHCIP3pMudJhVdKtsqQBGzKfaTeREHInY4rJk3kdS4Tz/KeAI+pUPN13agfWZhhnJ
         PJI6o/eHIhTrZMNhVHBEJwnUMR5dWvkj25yVPlWruj5BksWepWKnjtSYBrQePhLrvXxk
         NYoHqytpbhJIq8vd/ar3jaVc64woBh/HWz+mg+Yd2cFtHTc3SgvrHWBvxzaCfZ6qI3Y2
         RLIw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787562358; x=1788167158; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xjSchm007/sw+2JfMjG96f8T6RE12rgCCudebYixRu4=;
        b=pCmnOzLk7wcajdfXf+wvHzgZnayaIzn0y5HE3yaW5SNk2kFckSoip13zJR1/gcgWNp
         JGLCOrHnUBDQy85H095JWQOOadbZ63GBfK6Eb4TXtTbdiKoi9Z06sRGgfkfb9zFSsRgl
         Jd25+Tlvsh104RL5wdEsyGPzRlELSnU4P2gdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787562358; x=1788167158;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xjSchm007/sw+2JfMjG96f8T6RE12rgCCudebYixRu4=;
        b=aHwaJ+KUsApysx/7vY7P0gDMkn3JjZloWdEzkVKcLIKXWwjcIU7HA8+It/UjDmhT/n
         I5j8px7onJ1Wza4QpAmXO89EPcSMfFCrrxRosJpkxefbMfYoyEoFGlxyGg5IUF6wWB4n
         e6sU8ngmbudHVtzFFpYytHKhos627fHRBnkBbR9Es1+k3F9UqfmOe7qv27XpHR5VQIId
         zFtzqWMj0KzsTyAO5PbE2WAjfnSNDIPZCnnP4+jsrE3vlE5NnIJ2sQoXki8h8AoaKmA2
         0JdXo4sfEHxqUVjgALllrzmZ/+oe8OqkzMmU+uo7CarXH0dwAHJZgK2BZUUcr7Q6mxYq
         81Ww==
X-Forwarded-Encrypted: i=1; AHgh+RoDlIr6LLFV4NknOTzFCY0+6kvKfsGLnfEsf7hsRtpA0NDSHNXkHZUmk4qZVhjGBwEd4X+ciZvuBSxa@lists.linux.dev
X-Gm-Message-State: AFuF++lzUTbUXaia4QC6H+XJttd2ie87T4ZPDmT5euXpbOrfW5GGwmw1
	yjld2/ItC6oEXRbcEZY1RRmvVIRMCsvD/NxCAqKbeJDdV7NyTV/42xYQnqEpF68P2QZgyYJijDT
	hO/YSRBFBZN0CdFZBeywnEfVBlOAoDtP20IZcKksUKg==
X-Gm-Gg: AR+sD10oLSM8txkfRhA7aZN7IIGIegjbv/nqHUwE/mTGURPUuwRgBlBde3JZW4cEVQy
	hK/JAgf4IsVWipDi5EVXpMFj1gjZn56jzw2Kyw0DLZ0epp3sHucTGskjGdBgmSJoZeuwzYcOXE6
	BkshFLlKKeXdovJVR4Wc/Dck2NI9ethTwFirMBQidtb01aVgSpSKKQ2rC8duYnZXXb3qvthrqz8
	A+R7dFQ3pGFHwXlKO1e1yvpU0H7yRlOhfIe+tTy7yy5ZCC1JxQ6Vhv2tdGhQzLiyl09ECHGoHY4
	GYkPmQhFeZH/VuBqIpO4/wScseAkTepSY686JYIaQ0iLWs4a1mX1/z7i4O/nHOHqFF9cMa4Vkgk
	JXhU=
X-Received: by 2002:a05:620a:a2c6:10b0:92e:bbd0:260c with SMTP id
 af79cd13be357-9373957655amr1668397485a.36.1787562358062; Mon, 24 Aug 2026
 02:05:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260820193343.3852967-1-willy@infradead.org> <20260820193343.3852967-3-willy@infradead.org>
In-Reply-To: <20260820193343.3852967-3-willy@infradead.org>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 24 Aug 2026 11:05:46 +0200
X-Gm-Features: AcwNN1VnwXUZIDZ1PfaZZEyLrhKwB3yAlvrDYfoxcRnFp4RHIk-2JE_xMlB98T0
Message-ID: <CAJfpegvP3i8ZJc2T=+f4rAhZ4E1QcT5+jC6mQPLxtB-yoK9Brw@mail.gmail.com>
Subject: Re: [PATCH 2/7] fuse: Use filemap_invalidate_pages()
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Chris Mason <clm@fb.com>, 
	David Sterba <dsterba@suse.com>, Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
	Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-block@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-nfs@vger.kernel.org, 
	devel@lists.orangefs.org, Pavel Begunkov <asml.silence@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Aug 2026 at 21:34, Matthew Wilcox (Oracle)
<willy@infradead.org> wrote:
>
> FUSE relies on invalidate_inode_pages2() / invalidate_inode_pages2_range()
> doing writeback by calling fuse_launder_folio().  While this works, it
> is inefficient as each page is written back and waited for individually.
> Far better to call filemap_invalidate_pages() which will do a bulk write
> first, then remove the page cache.

filemap_invalidate_page() suggests to use invalidate_lock to prevent
races with pages coming back.  I'm not sure that without it the
behavior is identical.

Maybe add a variant that takes that lock?

Thanks,
Miklos
