Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26F23D47B5
	for <fuse-devel@lists.linux.dev>; Mon,  8 Jun 2026 17:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780938785; cv=none; b=j69gM7vYZ4csXlqO0VXL7JDBaEeFnYvjF2MLZkr11UQDd6gdVLTHt06T1iPPMlNVnQvlGTTDnTGlSEJm8x423da0Z4SfZHSrEQ6nhNJs/hHd+CtlJVqLi/STaRkAavTozVUCE81oJwuCFVmXnOCqTFHl5BugVsr3TtM61zHnlcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780938785; c=relaxed/simple;
	bh=G2yTdmM+jxM6q4Rp8QMqnUV346H3bZaSNYYTm8fmrQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RN0zBX+eSM2Qvg/p2H/iMR2O+W1gUcGGn4zq2w6tq0vMTDiR6/9ZeokL7JlEBn56m1xc3k6mBI3irFyU9ADcYzDnPS1JL3fTZaAqFyLEQA21PqAA0yQp0W3GrTX0dE4BGU300Tq9/xaDXsdWh485q+IFzQjYN4JFIzEJYs5H/hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=izDQ1ATI; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="izDQ1ATI"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490a76757e5so30082905e9.2
        for <fuse-devel@lists.linux.dev>; Mon, 08 Jun 2026 10:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780938783; x=1781543583; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUpt/EToVTToJvd7YASG+3OoKZxNxbXoqptfVbb/HeE=;
        b=izDQ1ATIfcNx2JB5jzZwKI3ux/IZLy3eRI5nG2VOI5Gnf+++lRrUAfDN4pMLtiOH6i
         7HOdxTn6ZaGOeDr9ltGCS0UrDyzjNSPwqeK/gPsRqsZBFS7C3y2RqMNA+gwJELAJlMwD
         jwAzg8akFUC+5sc0RaJ+Zpr8BzUtve8An3wYskd5oMhSGnFLNdzuQzu6CBUP2A2H0iWG
         NuX5jVRH6CwohqtE48GDxRMCIgpNFLAGHqemPOy7xSNN+MA3JGICiA9LApT7nntDth+i
         RDymbsAfdYq7LSHEfhbsyTSMSV2dfpdGRPcIxje7HNxKDhGx4yZH4dRMwTdRHlYbtg3w
         gvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780938783; x=1781543583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AUpt/EToVTToJvd7YASG+3OoKZxNxbXoqptfVbb/HeE=;
        b=lswS7+XbXxi6Ebi/V7rSvf12Ww+/jzXN+vQe1hzhTB3DbjYbhZFKQ4L1VCKOVRAfJ9
         xh2t5ntUU3DiZ69J/JuHhDL5PdsCJcoW33OC4NOKcK8o1pyyFfa8a0EWKhW4WcnPa2YO
         pVscH1Gr4PN6VqmsgFT3i3lgdyUJoKixm+g4ufZMyyZVSJ9ONp0rVaPGyssxycWNdLUI
         oP7oFw4HoryQQq6n+TVKNCDbyH+h5L5bgVCHgbNcEOiU9Q1ydvyChoVKeuXVDhz3+egv
         mFQA1NFVbAfXObB3YRv22gK6FQjD+ovbi8YpuOD5DTocvJyK03de43wfNBiPGqN9CXGV
         y+Zg==
X-Forwarded-Encrypted: i=1; AFNElJ9p0TQmzPDpkXYTAF+dqv8siuLUgTiwKgcpIGFp7l4r5eFCGkBzjJuNSyaF/rlJXm4328yAfOXtNOxO@lists.linux.dev
X-Gm-Message-State: AOJu0YzK0pKpmm+UA27eqlMiJn3dmIjODid8Wfd3OkJEcl1FDxPmD1LC
	7ihOlxR4djGPd4lK4ma7DhMf22RTGJJ/r8noYP6i6CosxX5qISkcLGNx
X-Gm-Gg: Acq92OHSNBg9diAUt3jtgRJEz8LPXLfxBROkhr5DX40GHSvh/hEqmUqRhvdiouX917G
	GgCpfNmG9+wPn8kHxHOxTnmsamcQ5Z049kAHZnRHR/LHHHH5QizSyB3RY6rP0mYa9D9NTWla/yW
	myraG7tZaYhcThG5MpZWUa9FO9h3lcSTCvEvN8kGIbbB/Ire3eybbkuz8PhXwMCWdTwaoIVk+51
	6l4CvOMMue3cfLYaWq453QgKH7zUDzi7CGCpe7DSEDfURi8mL9/MC64vF0+dztQ2pyjwUafeLBz
	97vP/FtAq97fuJXvI+xeR9rsF8+M1bEVDa64EuabDHRwOYh4R+Ae9jiFIXxH3UmS1LZKjzRQgu8
	qYolRML45sKNic2HWLonkE880R0Sk3ly5pJ67ZVTFKqeOV4bRDrFtnZAV+rcGh63PRRcOAnTms+
	AH8UhyfiMPzKFbrn3rrGOrclMVUEnoNQ+xQ1pkZKbs
X-Received: by 2002:a05:600c:458a:b0:490:389:7644 with SMTP id 5b1f17b1804b1-490c25fbd78mr244360025e9.17.1780938782731;
        Mon, 08 Jun 2026 10:13:02 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4601f351ac0sm97432933f8f.27.2026.06.08.10.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 10:13:02 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: andrea.cervesato@suse.com
Cc: akpm@linux-foundation.org,
	axboe@kernel.dk,
	brauner@kernel.org,
	collin.funk1@gmail.com,
	david.laight.linux@gmail.com,
	david@kernel.org,
	dhowells@redhat.com,
	fuse-devel@lists.linux.dev,
	hch@infradead.org,
	jack@suse.cz,
	joannelkoong@gmail.com,
	kernel@infinite-source.de,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ltp@lists.linux.it,
	luto@amacapital.net,
	metze@samba.org,
	miklos@szeredi.hu,
	netdev@vger.kernel.org,
	patches@lists.linux.dev,
	pfalcato@suse.de,
	rostedt@goodmis.org,
	safinaskar@gmail.com,
	torvalds@linux-foundation.org,
	viro@zeniv.linux.org.uk,
	w@1wt.eu,
	willy@infradead.org
Subject: Re: [LTP] [PATCH 0/5] vmsplice: fix some problems in my previous vmsplice patchset
Date: Mon,  8 Jun 2026 20:12:31 +0300
Message-ID: <20260608171231.1480447-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <6a26aa28.283787d8.1f1282.ba36@mx.google.com>
References: <6a26aa28.283787d8.1f1282.ba36@mx.google.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"Andrea Cervesato" <andrea.cervesato@suse.com>:
> Hi Askar,
> 
> the patch-set doesn't apply:

This is patchset for Linux kernel.
(It is expected it will fix some failing LTP tests, among other things.)

-- 
Askar Safin
