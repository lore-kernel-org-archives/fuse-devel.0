Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716773DAAC1
	for <fuse-devel@lists.linux.dev>; Wed, 26 Aug 2026 11:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742784; cv=pass; b=hW5yM0Dmg5cSR0bfasVuZvsbEAHquBJfu5kmkxj8W8j23Dpk0PIeP1JdrAseim6MNm9pAuu0g99XiS6nAxSCQ2J6+5Jk4Xv2ZkFIGKUNZ/9MwokofUvGAm5tngFED/LPJuyw3eq+B6Robrnvvo5eHgfKCp5HsHKR6Ln3HzkXTKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742784; c=relaxed/simple;
	bh=qxK0YDq758BFaqD9s7iCBATXt0a1M5kbbbBPljI+lWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FY+8k8wrEzsVSPwANqYNUvn+nc8H+xsbfUd5Kwh2ZXmffDrusiFZr/gZ+qbApK7XuJDjJEu+8jZdBNdtvqWoWbUy8oPnOJ0+kq7QNfWw+7NXNrIthxkyf2OojZpM2n/yLBvDU4uZr5nxvbbWX0Cyo1ybja5t8X9ygbmvD5PsgwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=JFAVVKUr; arc=pass smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="JFAVVKUr"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-90c4e297a01so5712186d6.3
        for <fuse-devel@lists.linux.dev>; Wed, 26 Aug 2026 04:12:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787742774; cv=none;
        d=google.com; s=arc-20260327;
        b=WV4TIXjYKmS+uA+9Lou4l2nw/0T7oVPbjT97muGh9CggaT9oujK1sv0KmUxwc6/rVZ
         mbtjIliYpyknOFLWltt4ATcs+5Ze9PU8ujrVGEuf8KW8E3j0ho/jFaKdGeMGwhQwMXL3
         Fq8ODZxa1fndLcbySjBtxVG7Zp32fDu7fodfrrlxRq7kBvjLpPBSWxkXaLO6Dcvx7heN
         VQGthfFGyvfdOjAIcoTRQkQyVwl6tBZOHuZHUJ4TNIAIxvoUBLwRKloAhHS3oxC/uPJl
         2kJrd+4qMslm7HIpxiHD4CNzaw6+RLuKDDfcRoFtPTRyGwe20Sz53jGnmm/k8/hHFQPV
         C++A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qxK0YDq758BFaqD9s7iCBATXt0a1M5kbbbBPljI+lWU=;
        fh=dnIigspHwwBGvs+6z7BIMZtV5ysXdMxb9xycTaC6qJM=;
        b=A25S6xRz/3Gs7olZrDdzvce3+fbPf3KSYSpfkCVkk5HXizoucQ8cS62ZcWA6wJrW3f
         JXJSK33AVghKESEBS4radCnfguB4QVdkg6qQ2inuAj9kDdJXWqWvJM02eY38HyTrES5M
         vH9Yo+uQXrESqewyw5wkdV9fytQIof/hQ0rRC8OdYU6vWbEBSoVv3DNyMVov0L8+zeBn
         YrlwEXFfPyavNx4Bm8JkJsqCxSvRbNGIDmyma7aQUFrUEhz3+TmjxXdKGAOnsvo30nqw
         FAX2mXsxY6tp3ku4xJdRAtEnyAv0JnxtQAbGxAK1ZtTrJ+Fr/WHQ4TPmSyJxqNsv468Y
         hv0Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787742774; x=1788347574; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qxK0YDq758BFaqD9s7iCBATXt0a1M5kbbbBPljI+lWU=;
        b=JFAVVKUrEKrUDvk+EvNTHOsaz9krnjpwv8SMp/UBcJz9lomd/IOaV1BoBuktICqQ7a
         9H9LAL0846TI5z2LUaRkoxuP1n2fGfW2tc+Ko4sVzlfoHktEPQMkKWnwxSwjczXeeIYC
         1Yh/48D95pI+Ku5zDrEbcAzCBe5+XviZAbDdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787742774; x=1788347574;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qxK0YDq758BFaqD9s7iCBATXt0a1M5kbbbBPljI+lWU=;
        b=tWq+icUY7FpFEzCDK09an1fRJbo2kUNlGPn5U+yuc+fjYdX4m2QvGXBRZhV5INxT0P
         U54mb+hvvgMZtoLYSDHQTaZQU2WIX8lk2sPHpLgHN5VWuDo7aDIx92IUZCaEJHZGwWLk
         gHZvXYqWnY+gDtze7WcU4roPqqEMIMyU+v637ffiYaH557+/GvLDCsKYW28VQKu5oz97
         L4nkwzrObKJu41PAWxQBnjevmyHU8YwSl1i/aPdzyymc00o3gK8A2wTHbvnSNpY5+FHh
         RO2aLbyfN04OyJPXy0OyUizkjrkWvjyE3nMG99EqnJ7hlHx6Ghm+qgJs7s0MtyZx5FmH
         HF9g==
X-Gm-Message-State: AFuF++lei63C4qxFoA5aLbfHzzDLGLi4n1Q+B7AJ+6Iv/QqfpSbsYL8a
	w1tQbFgSG3Fx/CBMMtuqlooFRyVHdWdGuTdTeTiEJlM15xGcgNSuX3AczL5GvO4shX8hcs51GPR
	UIT0uwA6jggX+PsjT9UzRskqYnCpj+oWJzjtashomb5xSqUL3IZY+Skk=
X-Gm-Gg: AR+sD12S0IV1uCelgk9UePYHWB8BPeMKf5qOkjIlx4oGWdxMHAZUr4/dVaFjyMAbe6O
	xauQ4G57RsGncQNHEs5zJDLcgsdvG6ZZGa23/slqamyuv5slHcxt8t82LtqndfJuO8AIDOqtcmR
	UNh01bw38uVkYwHHo6+YZDXtKgMeD0WWSZVMF9oTM8EzNt6UkjBEzL8lIoEXFSDRkfrIHcB+vxe
	zBJEogyGYdzw/5uf5IIvhEKWDbT4f2o/9hs4zXXyTdRU86MD7LlydCiS+k9E6d3+tw0lFwGjV5w
	L02438FYYGLMDJG6A3wMWYJxGwDIypusr1m9zzwnTzMYnOF/6GDMnvgPtMp66KfiY51YjuLHEgj
	bits=
X-Received: by 2002:a05:622a:598c:b0:51a:89db:95a4 with SMTP id
 d75a77b69052e-52e42235c73mr56562851cf.6.1787742774296; Wed, 26 Aug 2026
 04:12:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260717142932.71778-1-jefflexu@linux.alibaba.com>
In-Reply-To: <20260717142932.71778-1-jefflexu@linux.alibaba.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 26 Aug 2026 13:12:41 +0200
X-Gm-Features: AcwNN1Vo_Xquz6yQXC0Ul5m-lrRUzwHF_AGPWQxv0w2EORhRsYCELfowq71-yN0
Message-ID: <CAJfpegs61t4v1OUp3t_LktaVM=yVj0W2bgEQ+a5EVKU4MNyCwg@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: don't bump attr_version for async direct read completion
To: Jingbo Xu <jefflexu@linux.alibaba.com>
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	horst@birthelmer.de, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Jul 2026 at 16:29, Jingbo Xu <jefflexu@linux.alibaba.com> wrote:

> Fix this by only bumping attr_version for write completions, consistent
> with the synchronous DIO write path (fuse_write_update_attr) and the
> cached write path.

Sorry for the delay, seem to have fallen through the cracks.

Applied, thanks.

Miklos
