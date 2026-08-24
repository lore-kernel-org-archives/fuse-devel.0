Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6051B426D33
	for <fuse-devel@lists.linux.dev>; Mon, 24 Aug 2026 13:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787579395; cv=pass; b=E2wCAW9dzeC/0XS1JISvsjRD5MPu3tdB84BwuiU68hpioPjqSnTIrba8X3JQlXeZlf/C+omeQgMvpcNZUQKnM5XfYC/s73/1KEd8aR5BHQMcvENrgDGFVc9zXy1l7lziDv+eEJ+JSRMxpBUfMD6uvHOg5PmHhoZ98pGdHVesfao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787579395; c=relaxed/simple;
	bh=Gdi0w031Cj+0ZM8jnslnu596yibLYY4OhKTpyU6L/3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gBAudtPsquBjmlmrT2iyKWIXcC3FUaLzZRh5AtiGAHayt8/B6Arm+ufmgKlCfmKiXHmjprzy5OxQvENg27+5QtYf21uaIBfVinLfdBiDCk5xlAfDxcBe3LvUkZL7bBEJkW8FM93Y+8dWwZIMe9ZXrVG8GUpzEp5ORuSmPaFqKc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=Oq8mkicM; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="Oq8mkicM"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-52de50e77ffso26100721cf.2
        for <fuse-devel@lists.linux.dev>; Mon, 24 Aug 2026 06:49:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787579392; cv=none;
        d=google.com; s=arc-20260327;
        b=T2E+7mP13DqnscoIrrLve0mCLxRk4OXEc6JQvd9n56ZVwmbEBXE+NZ1u9H/8Yv53g5
         Ape1XqVoWIGGdDwOWa58ziItQivOiIjYeQMzwNAAdB/gFZKToV7P3ncj75EIlKrJXEpE
         pJVz3CoXcRqrIX22zA7/X/hOKMttmWSSM+oAExsKmGET5TtseM83lnZOAzFxC+B5biaI
         1lueO6RdDLtgC0pGH+p3s8W+s7geyAUPJDWIvG6mIQxB71wNv/DaJ90rpJQaQen/WrJy
         t5/L0w+vaphTmH4LoLw1u2vRvww8Ooa+jDVGboD+nU6Tgee3m6ws85Ko152bdZfB8sXd
         E5lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UWqjXIcqtIZGoXJHhXghNNIDKwEBlEpB/YPKWMii0qs=;
        fh=zE4A0pHZEkjTtf+Qf3jt/KpEsESP+I7ZUuz0eLST+h4=;
        b=Eme3w3AECFpPkzzx/fE8k+n1vTnzZ+ywsS9Fjmb/asISTGJzUEwESTs1zp3Oy6eULo
         JbR8tz1QfgOKYDWXoJctm2bTHc6Kwp1zwWdUnpsis2PDZn/Zkv/CuGEaAbSVx1FcZWib
         p8KFtK6eoVg/CqS6CYNM9HhVQeKec6QAqnlSLXpfVACscMCwDaAmvvzjCPWFt60TYZHS
         UlMwSSn/maiT8jP626pDP+7TeXkXCf5T6Xv3KkC1pNGfyPi/AVmx4L6NXbGrL01T9n+y
         dYfRBZmZqyEcBoyHObzRwKjas4xIQoJgITS5NJFxX67mjq0uWZGLcFAB08PRaN0v7QhK
         JQbg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787579392; x=1788184192; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UWqjXIcqtIZGoXJHhXghNNIDKwEBlEpB/YPKWMii0qs=;
        b=Oq8mkicMDytJMunAwndQ8hTB/YlPvx5ZIHX7+vdN9OlYKP00ZUIKQT5PjDadTOIExz
         6gDXbay020X4AxnPxPz/3zSUB7qXfrlT0TSKJw0SJppGIqFH+iLpHl5eJLT2XK6rE6+V
         uU51QReWsHjnNnAiUbHBir7PYSvXOkwdqbnow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787579392; x=1788184192;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UWqjXIcqtIZGoXJHhXghNNIDKwEBlEpB/YPKWMii0qs=;
        b=ID5eLjzOqWH1AOlO2QSy5Hxv0kvVPuNJP2rZX3/ByE260T56cOFWkdmJOaF8BxhxXp
         n38PfAhMha8AkzyRs2Yw70oPrJrPr/3R4tFnroS41ZpGi1GKhhAd2PcUJIqY6nLh8AfM
         mEfDuaHfHawGtsXssONVEOFNIuinTecSN3t5FGjP5brZN6CS5fGTDkegBi+ogVSMWtGn
         g0U4r6UeTWpC4pmpiWVediPZlduQcTlmTZvLkr7EVwMqk5Ik7KNPv+tqUbCA6wxLAWgD
         W6zcWwS/ALlHPlCmrnaSpgzDR2qgeKRDM5jCUssOYSH2yhXGDaUQir7+1KK1ff/YmJuZ
         4WqQ==
X-Forwarded-Encrypted: i=1; AHgh+RrW0yrFFL6SFaFaGmw+zVehaZDLOtWncU2RE6gOr9WhN99L8z2xWxFOzI/Babf3Xo2o/e2o78XjE1C1@lists.linux.dev
X-Gm-Message-State: AFuF++lzpA31dgQXGXCLdjB8qYqKq9RjlGZt/+Wp5f+OCoydNkNWEGSt
	72Rgh4z7uBINRuhv51Mmg6sVgWLTOQald3Mqk4jmG1dzmgB0tl9d4Vo2tm/LpUKDol3usu5O4tg
	eQY5NiN/Ya/q9dGMsmACYG+4PVLaEuJT5H7REVVOVAA==
X-Gm-Gg: AR+sD130qnIeH+UggRy7lTBIu6rChJfxfnrVz6eyejblweTR159VIqDzDK5E0P/BjFG
	20aUdD7m3Hdee4G29mhTtsPiVAjrIrl+r6MoG1Mr0etH00Ap1Ssh3rCkJwB5EVji7+9skt+HdVW
	A2QfDsneX+dbzkNpHgZMF+ykcIbnkmGDnRwftDnd94ZGdUfNYIJ3x6MLIkD+HByKFQHxH7yEAqj
	Cs7ZNNbHI/eJSdatV4nmhj5mQMOgb9H2K96TPPKY4OwsfishXYhrgmT94iAaUu0V01ISGTYml8+
	iKtVBjSZVbNqqSQvLLA/b+L8wifuUkBv0iL/Nctsn2X98iYEf5Hjh2nLxXx+2eCw19KLsCsFROY
	Wulc=
X-Received: by 2002:a05:622a:8416:10b0:52e:1109:8f6d with SMTP id
 d75a77b69052e-52e1109944cmr94356391cf.42.1787579392384; Mon, 24 Aug 2026
 06:49:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260820193343.3852967-1-willy@infradead.org> <20260820193343.3852967-3-willy@infradead.org>
 <CAJfpegvP3i8ZJc2T=+f4rAhZ4E1QcT5+jC6mQPLxtB-yoK9Brw@mail.gmail.com> <aoxHOSC9kTPbKeNq@casper.infradead.org>
In-Reply-To: <aoxHOSC9kTPbKeNq@casper.infradead.org>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 24 Aug 2026 15:49:37 +0200
X-Gm-Features: AcwNN1WXkLYVG2Rn2OXRtnBdlHWAinn8Fn4WcEVqUKiB1DB-194nq79209afcM4
Message-ID: <CAJfpegv3Ak+qNLb=fTSCSz7-taQ3Ui-Hkmqgn4PaGPe=CR4cbQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] fuse: Use filemap_invalidate_pages()
To: Matthew Wilcox <willy@infradead.org>
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Chris Mason <clm@fb.com>, 
	David Sterba <dsterba@suse.com>, Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
	Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-block@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-nfs@vger.kernel.org, 
	devel@lists.orangefs.org, Pavel Begunkov <asml.silence@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Aug 2026 at 15:29, Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Aug 24, 2026 at 11:05:46AM +0200, Miklos Szeredi wrote:

> > Maybe add a variant that takes that lock?
>
> I don't understand what use that would be.  As soon as that function
> drops the lock, the pages could be reinstated.  If the caller needs the
> pages to not come back, it must need to hold the invalidate_lock across
> the whole operation.

invalidate_inode_pages2_range() together with launder_page guaranteed
that no dirty data remained in the cache after that call.   Yes, the
pages can be reinstated after that but those need faults and the
server can then serialize those against the invalidation.

I don't see that guarantee with the filemap_write_and_wait_range()
(with or without invalidate_lock actually) since the mapping can be
dirtied again without the filesystem's knowledge.

Am I missing something?

Thanks,
Miklos


>
> Before any filesystem people get funny ideas about closing the O_DIRECT
> race, you can't do that because you'll deadlock on doing I/O to the same
> file that you've mmaped.
