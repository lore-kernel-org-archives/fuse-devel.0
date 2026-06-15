Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEEC3E63A2
	for <fuse-devel@lists.linux.dev>; Mon, 15 Jun 2026 12:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525220; cv=pass; b=DkS//0sJXy2Gnx7ZRr2jUq5gUVhD++RDcbAwCk9YArLlhXNVFXRjTYfytk0y1u1JM5Tkf531sc+sva2cg5f/OcsEkDoYDk+4y7bd+EdKjsbrZvrOxJZP25WrNuIWz+u+92hGy+W/AFRZ0aqQJJkctg3CM2W2zLv7o9iIFWOSmzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525220; c=relaxed/simple;
	bh=U5+Dtyj92Cp1mydLvL6zeGoWBbG9j1QClVDIT7+nrzY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vEEzH1sl1FhFftuDgALMUtwZ3+YkhA1L0HzPI8NX3kyi460QUYeKXzjhSFUeL7hTqd2O7EY12DlY6TuS11sdXXQtuuzovIPPzfsX232iO0nqfFJubgzuV9fwul/RfdEMyHqEu5oAji2yXU3A2CFU0yRb8Lr3/d4Ev6k0oAYL7k4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=CEefbd/M; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="CEefbd/M"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5176ca6bab1so37656031cf.0
        for <fuse-devel@lists.linux.dev>; Mon, 15 Jun 2026 05:06:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781525218; cv=none;
        d=google.com; s=arc-20240605;
        b=ArHwqG4n/1FEeGcTyVGviKwB0UNvUzYURLzW16pFRosPoQt7AfG9yuatdE+3HMk7eH
         fCIVlByGMQCV6W2LTg0FUUK+XvwdmLTma3mGIZ3seJ21TYvcj8kxpH1JNDAeDfP7KFnv
         wpWlmQppZrXuNWHKIkLw3pdsxPzC9pTdtZrN2i346hyO48RX/xtSBe5wLTnzI07OTf1e
         NFcjDHK45XXai6EAPJgq4ZGqjgnm/KN+N0Rq/t1Sp55Wq3fRcrNZbTqyb+Ir0AwPXO10
         HbZLVWvX9JAcLvalPXhU6aVHZHC8bphMC8j+2qy3He2FKj6M08Y05JG8PRikLX2AauIV
         HKQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U5+Dtyj92Cp1mydLvL6zeGoWBbG9j1QClVDIT7+nrzY=;
        fh=b7DYOJVphdfaH+6VBDAePMLGOd7oY5wfaJe4SGjNIew=;
        b=Da9RIUJ3DwjXWh6mMvmu0MpW2wFGENbUsKkgv5Tchv54k5vj8OdElPEJDaGgJC6wWu
         +9qpHIHUwCQIdThrGL/5jPXm6BOznljTG5xSBoV4+4WCPbuH7oNeHaeEns5U5bFvOnHT
         hSqyeTPnD3s6fBxfN+90R9sFKUqDw4n5jBj8BrmewAs5oUCmpl91ADoF+hdvRuWm0v0q
         apri6cG+ggc4u6jc5W91V7CniYrCKlJsmMRgNbzdiBOeJdB/tIp8pjZ/1nkHjH+U9OEU
         cpihhaLVvDG9jiprHk1BAfTTajhSjKo3NMDkAWFJyq7/X9bjSy1jfE56r1QCHTAXQhwD
         yuiw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781525218; x=1782130018; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5+Dtyj92Cp1mydLvL6zeGoWBbG9j1QClVDIT7+nrzY=;
        b=CEefbd/Mdsvz20VINRrnvQX9BGQJlgvIJivNIZbYFrfI4OsLJvoT59U11XbDxZ88G5
         QIpNjL27GWuQq3607oOl8dqaxawt1GeT0mkHjpywpM6sYD+KfilHyxAWpSPig0XJHm4Z
         ZKsJjT6+HYkMMlFn/khbT6VnvvYb6ieUEoe4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525218; x=1782130018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U5+Dtyj92Cp1mydLvL6zeGoWBbG9j1QClVDIT7+nrzY=;
        b=TROpRvucfnERpfYE9Tn/nvNSZHAqUSM5kSx7C5lVu+xXb2avaZ10zYcPeGBTjso24y
         Phmw0Ltkp35kLTPJPMqMmNb4N5Qsu0oxdiR+HZjCN4uE1TEczMHOHDJppo/xYuINz8Yz
         cAv/roMvsBz5sa2xpF9sAylqv/bRrTaPXVDw9iKs37YIBw3G5erb9q+HnGO+/6CPXCwY
         NGx5WkKSvCXROSoq7InhSDgcy66s4IvjX9hxVbaO/GLouD91qiT2KUJPrPA7jSBSofA5
         XlsNSDdgTCtQNpLU7MGilmYR7WbMnhbd1Sbf82CZfQEp5VbGGZxhDkKHFL60yjVicxfF
         YPBQ==
X-Forwarded-Encrypted: i=1; AFNElJ9b+uB05debUCp4nMai+oZCWta3jRx44WRRflHv9eeoMF2ZYtwGKQX5Jm9t/LK2i/PDe9SJ1Sb8kXAJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzqWAtyUPmkh7AcpYNLkUD3F17wq7rvdIBwx6RoFNutacvMilCN
	PJdda9DSN7Ikni43co8AGK2yHB29zvgz6QLvzAAn2gyBkLLzrtQkB6dOLHOnzVFeqKWZuzMn3Lj
	x/kOCjsYjzqo8cu/0Gw9h9/gijnBZt9KlC+En5LjFXg==
X-Gm-Gg: Acq92OEbCJdKDS7Hx4jpyP3aujGQsE3J9g6OFrIDJ28TolQ0LuRWykr7wMWxyQXp9+U
	ygTHBnUan4F6aKRsvpadQI9v+avJuKNCqkRiL8fXzgnV2CTyzBnUJMOL6/WjlRIzQMTC5lvZffO
	mw4ep4bJmmzcf+lJHHIaO9Hg4RZXryfk3ou/mAVhNel/iWMu//nob9NLbi6hNvNZt63hlcjc41P
	xANKIFt3BZIgq3oA4xAikymp9qnY2X+6W6k0LvkfhvBOBokyVXmNUAwUnRpbb15bysDeLWgsO2v
	0om/s/nSdkzu+vDMCsX+fuu4JTQI0REHQTxgOQFC
X-Received: by 2002:a05:622a:4087:b0:517:c65c:4987 with SMTP id
 d75a77b69052e-517fbe63f9fmr172980451cf.22.1781525217657; Mon, 15 Jun 2026
 05:06:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260514124102.2703313-1-chengzhihao1@huawei.com>
 <20260515210719.GD9568@frogsfrogsfrogs> <953d1dc7-f1a4-88a8-1db4-0902b902055f@huawei.com>
 <da9772f5-d20c-0efe-2fb8-74f14e8d490b@huawei.com>
In-Reply-To: <da9772f5-d20c-0efe-2fb8-74f14e8d490b@huawei.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 15 Jun 2026 14:06:46 +0200
X-Gm-Features: AVVi8Cf46ToXFLUljrVLT-E9tsS9hq2SQ-TDV4c09SjHVvSVJt0bE74a-szir4A
Message-ID: <CAJfpegv0SYbE_TB7Xy24VWDFSvghHexwzxLJ-SyNQ7BXky4hLw@mail.gmail.com>
Subject: Re: [PATCH] fuse: virtiofs: fix illegal inode address access in fuse_release_end
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, yangerkun@huawei.com, yi.zhang@huawei.com, 
	fuse-devel <fuse-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Jun 2026 at 13:08, Zhihao Cheng <chengzhihao1@huawei.com> wrote:
>
> =E5=9C=A8 2026/5/16 11:20, Zhihao Cheng =E5=86=99=E9=81=93:
> > =E5=9C=A8 2026/5/16 5:07, Darrick J. Wong =E5=86=99=E9=81=93:
> >> [add fuse-devel]
> >>
>
> friendly ping

This is fixed in fuse.git#for-next:

https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git/commit/?h=
=3Dfor-next&id=3D19e8d6bd9ec35db2221e84bfeb1862ab6688a4bc

I added your Reported-by.

Thanks,
Miklos
