Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E6746F495
	for <fuse-devel@lists.linux.dev>; Tue, 29 Sep 2026 15:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697504; cv=none; b=DVx9iKEF5/qSrUtkYxBBahzIwUjL10EUSyx/xroJRBW1hrvA5fBIdxVfPz3fwIe0onQHdhbBO5ESC26Fy5nNaJgGPW8FbOxYNHcQqieasFY4Yz0/EvaGCvUzG/ujLJJt5hzjtjb3D3rtb7w6w+LbHUQ7bqBrrwtyFBWvpi49w6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697504; c=relaxed/simple;
	bh=nR4yrTOIgVgspvjCPgKKmvkm5cZCrViKQN79fpTorck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQGnW1gJloY1pbEPWzCYCd0FU/AXn30hWIkU7mJXnNjDOnIfcA0B8cBMBKsmnsA0dS0wiaxjk/V4uiX4gdR/XetFrnigL6rVsvZc8wrwhbTt1JyxcmMuE1VznSPzjDwtDB4l+Gc5ApwR/WIWGUEHYlszufXuCYfHfbBLFHXB6so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Ai3ReLqh; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Ai3ReLqh"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3931so33268285e9.3
        for <fuse-devel@lists.linux.dev>; Tue, 29 Sep 2026 08:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790697499; x=1791302299; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gf4CL38l7K7zHB2Jr75kV3VIF1+DE+Av3C/FhqhlLqk=;
        b=Ai3ReLqhIvCmoK39cH4pU+w70KIn7wp8g0MdMrd39RmjD48xw/KWex0D/x3Ft+hCaK
         tvl36QVny/fsSJRGnKqRfH8/AuVe1kX4p0vLZrcGgLFHMvVwN4mwQUVMvL2BalXpEACH
         SFilmwEHfj/uyPcWsV1xBmeO5M7mqMCGuNOK0Wm59p6y71HnffbfapbY5sxbY1zaNWDc
         OQSR52byYZcnzxBi2hyXtoBmNvsUmxaIoF1zLmH4CxcZK0wrwCYeYba0ePUF+BNbPKTj
         Za2TZFMawh+DNI3QeO47aS/JsqzJAFXOt9wGc1THmxTe7DSw6/7/JZ7N4EySbnY/t9PZ
         k8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697499; x=1791302299;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gf4CL38l7K7zHB2Jr75kV3VIF1+DE+Av3C/FhqhlLqk=;
        b=qfiKsQrx9Ezr9OwJ7nUzo2XFdAOaHkg6jumdaZV213+gL/+P5B5/gdC/aLmUI4g1KB
         N54VLdGgUx71Ig07aD8HCVMFwDTjpX8ZXObikHZos9vrbnFMgis4n6PGXSQ+0tv1sUYd
         c3uPRjjcMg1Vy8JUBX92VjUQT8VpKt0Dviw8sWbbobVBwm8SQJz2oK08qiPtLdY5CdQL
         O22KNeO5DLpWPZxuRFTMvSJxowCKkaNVpaIACNwoFBZRFrX0XnZENsiiG/SW2Ne+URS0
         XJIC/kQmzcvXJyPbsSlQDrAQGaCMXNqXBM7ng8S9X1tGUXvLUSguYai1QnDgfKVphCxT
         EeWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmo58lAz7HG9Mrs8ZEbpwvYA6tI/L5FvFSuchawM26UacrfjaQRZjqL7gtT8B5xTjjavLpyAYzk9hd@lists.linux.dev
X-Gm-Message-State: AFuF++muZk6WYNmQd30/WtqkozUn4Neo53RUFPCrCS0o48zxl068A25Y
	Ukic1Bykgc8uNlWykBEHCEfAh9JLSmu57QfAeZVW7KrH6NO+9YKUlHw5Lf8opjVQv2U=
X-Gm-Gg: AYBFou2nJkteH7otVXNwjCsVaNP6qZzi9KyXatd//enRDiWJTUq6tJt+XCpZolxgn3J
	KxQK6tIMq7z2SaT2IoDlrZllhykB6b1PyNKuAtfOiWfPHv/elnsBMX+D6baE67lYC6TWo3narle
	8FRX+QaHB0OYvxaR32unH2psIds51QQx3W0D3thE8P3yLgUxJP3PXZ5WC07qZnPBrIgT53aK7wh
	Iku2ZpSEgTzBkh6wXndzo90uIc7cjgn4ZjUt75rv6Y91qrJqitVIRXlm3gSqfLwy/g7wQqxW8du
	jXj/QxA2e99/Lyr1XDeRGULC2z9cAKO1Cm9ViGRMvwNJ3Cgc+MA/2E60X4GWeO0yX/A3RCwXznS
	FUWz7dNlfwJpSSjD6wEBICYwuBt/bZHaN7fbTUry0Tn2kvykKzmmFj9vVZ8bzP9j8gdbxkiKA8D
	EjqCt04odhf41ooRdWUL7zuuAorSsWVcI3t2n8bNj9AS+mB5aanaTNKTTCFZDf0T5xNgTdHafdt
	vGI
X-Received: by 2002:a05:600c:1d1c:b0:49c:eb16:9fd with SMTP id 5b1f17b1804b1-49fe66c9ae3mr284330975e9.3.1790697499193;
        Tue, 29 Sep 2026 08:58:19 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c092:500::5:5c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf9dfdbsm127631095e9.1.2026.09.29.08.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:58:18 -0700 (PDT)
Date: Tue, 29 Sep 2026 11:58:16 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, 
	bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
Subject: Re: [PATCH v3 06/40] mm: make map_kernel_pages_[prepare,complete]
 internal and unexported
Message-ID: <arvf-dEnIzsXhzkL@gourry-fedora-PF4VCD3F>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-6-4583d8a23bca@kernel.org>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-6-4583d8a23bca@kernel.org>

On Thu, Sep 17, 2026 at 05:22:15PM +0100, Lorenzo Stoakes (ARM) wrote:
> There's no reason to export the symbols for these functions which are only
> called from internal mm logic, additionally there's no reason for them to
> be declared in mm.h.
> 
> This patch therefore removes the exports and moves the declarations to
> mm/internal.h.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

