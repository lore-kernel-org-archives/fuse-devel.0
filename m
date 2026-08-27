Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4345418A6D4
	for <fuse-devel@lists.linux.dev>; Thu, 27 Aug 2026 04:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787803377; cv=none; b=oHfjUhN9YONiTt90yek45sXqQa00d/1qlucgFDwXYecYmKsp90HgMzuYxX/rBfb+/JXylsbGre2cGjLp7eFeG1BqBHeG1xsYiTFJf0bCRhz8/Ekmq/ipybgcJkkQFnnnz6j0TKPLlaSzq4Z9/oqlCGLdfAdxszmb7o8GeO9GcLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787803377; c=relaxed/simple;
	bh=eXd83mU0DRhOPBcUnx/U3XfjG0BwFyxeO8U4P/40eOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hFks1H5BD/nAZs/T8ilRyhSrg3K+IGMNl59+X233FTmz9c1l2dsKozy9EKE/OmglwMB7SLAjzYVLyAH1EReSAqrtdklBD6hPK4nC2VWFaAfxYC8mEssk3OI3Dv9l9o+4Z/tGPmqRPNr5C77hXVGSs3NuURAygHphWvOCUbcas6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PH5gR/xz; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PH5gR/xz"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4956869750eso10359315e9.2
        for <fuse-devel@lists.linux.dev>; Wed, 26 Aug 2026 21:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787803374; x=1788408174; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eXd83mU0DRhOPBcUnx/U3XfjG0BwFyxeO8U4P/40eOI=;
        b=PH5gR/xzu8pcsSqpbIKEmCV2SIxpHYL3SAEp2EOZkErev37maWmqJIurlH4OuDnNkR
         UgbNkqFVQ+ZnHObscaX+KF4XA3HyotcBB2qBvepJkT728x8cIU0QmqnxWlW0v7jxhg0i
         yD3QL9YWkwovn10bA4w0/M8P2U+3HhupiJCG/ys2hitPewMVK4dd+nkJwIVGd1R1F5hZ
         l7IT/0rqbAxqzcn5tHg5+xqOqo+dCDOZ3pg3HlmBi3llAKY+SKYCywcqoEOGpzeyeULL
         y9zvp7CtBUIgNZvmH5lz+OBZbk0kIfirhwK8qm3x3PjKo4gYqNn0BKih9SbkYuV9jfRu
         ap/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787803374; x=1788408174;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eXd83mU0DRhOPBcUnx/U3XfjG0BwFyxeO8U4P/40eOI=;
        b=AaKci5wUDtqpCYghyhJ6jmpSPY6stYPKzZCr/3+lG8TQfjSpYu1AcxuCUrf2tyYnrA
         fha7lqiSIYrKe3Avdw96gZP+OGN6o9z/xuMu2ewIaGMQw+kVr9jiMm6Rx4GA+qCFhTtf
         OqA00f1muKDYhFpEIXh/KLzZ3o2xtBsdu/up8+q5C9cszFiy4dO58yAGIpOowjzA2UFi
         llFi9KmGBFdaAXZMt/qdLibQZ1X7Xn1NUdxUQGHMdzASHwAYt0CcgmNUK4VxtH4eNvq2
         kKVTRBYCQb9A2KZFVGhIlVGiKRNxhdTYgxfemtoPGk1s59f6TfV+o9ReI/otEUsq+Zh0
         eMVA==
X-Forwarded-Encrypted: i=1; AHgh+Rp2j/Xq9x7/pa80RfybmlduAQGMEClhoPKEjzd1NtOw7AkSAORfXAnybbG/TpCaeff4eDQHO8M0NJjJ@lists.linux.dev
X-Gm-Message-State: AFuF++nxbePEhQaRKjEUGs30yr+sTHmZbqOx+UR3mkgsLpVBKRNR3dIK
	dumuLvQsp5Da6+aW3kitX7jBCdaEYbBQax/hUl/aWHlVIsg//MXrgSgM
X-Gm-Gg: AR+sD11E2wkFDeOBwv0hpxA3OX0wNIOGE5eu4oOjiB1YV4dT0y+UxdH3SKYzapw7y9y
	Icpr2Jn2xxKs3gFL0c0ohrusSMuDDDN+S+gVljsDPr62lySlPgc6CnLUBWJQjSAqDMNfxxsYlQ8
	cMDHCI49NMsnsqIOv7McM1VKi7FVXrRLibLvqMtGeZoNKpnIVp8z8gFFEo8rmYrkYNalG7cW2H0
	HdWKsFyjFYsIATa+jFNYGUCKwPvYbWxMB2dVc4qbU4C+8Un0UmEOuDprlq8LjL5+fGjsE4RScWB
	DmxWLCSNVwVdILsbttjm1lLnwAGd5zh6I/8BJJn65Z3GLeP+y3XKSe65nyg40zua1nGH6wQOyqb
	e0o1OWgJNeP6tvq4sEUXJHk1CBndBy6oHRypxJMPL6dShy2ZbelHIVLH/DygOY/yLTFkBnmRLtO
	QNyUk1tsr0bW5pjMxQFXLWEzY9QYCMvsu08uWnLNv2l2pgzGvJZ/nFQz1mvJRXix9hOPdqA5B1w
	N1gex9OaJV36/fO495cEsl7dqdQZdym6V/uraMxifuu8blL1+Epyq0IC1hq77fHr3Fwcm/t7kNU
	ea9FOMkmarVGKPsCWBRn0ioQRoS5cJ8ZZg==
X-Received: by 2002:a05:600c:3112:b0:499:db6e:40a5 with SMTP id 5b1f17b1804b1-499dc6fba17mr110628085e9.4.1787803374232;
        Wed, 26 Aug 2026 21:02:54 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-095-114-154-097.95.114.pool.telefonica.de. [95.114.154.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd5721a0sm43485315e9.4.2026.08.26.21.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 21:02:53 -0700 (PDT)
Date: Thu, 27 Aug 2026 06:02:22 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev
Cc: Joanne Koong <joannelkoong@gmail.com>, 
	Jingbo Xu <jefflexu@linux.alibaba.com>, "Darrick J. Wong" <djwong@kernel.org>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] fuse: fix GCC 8 build with CONFIG_PROFILE_ALL_BRANCHES
Message-ID: <ao-2iab_bHH5ZFlU@gmail.com>
References: <20260811195733.38489-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811195733.38489-1-kmehltretter@gmail.com>

On Tue, Aug 11, 2026 at 09:57:33PM +0100, Karl Mehltretter wrote:
> Fixes: 25307ca50b815 ("fuse: simplify logic in fuse_notify_store() and fuse_retrieve()")
> Cc: stable@vger.kernel.org # v7.1
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Just a friendly ping in case this got missed.

Thanks,
Karl
